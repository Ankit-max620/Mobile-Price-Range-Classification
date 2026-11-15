
$ProjectPath = "D:\Mobile-Price-Range-Classification"
$Branch = "main"
$DebounceSeconds = 5

Set-Location $ProjectPath

$Watcher = New-Object System.IO.FileSystemWatcher
$Watcher.Path = $ProjectPath
$Watcher.IncludeSubdirectories = $true
$Watcher.NotifyFilter = [System.IO.NotifyFilters]'FileName, DirectoryName, LastWrite, Size'
$Watcher.EnableRaisingEvents = $true

$Sources = @("Changed", "Created", "Deleted", "Renamed")

foreach ($Source in $Sources) {
    Register-ObjectEvent -InputObject $Watcher -EventName $Source `
        -SourceIdentifier "ProjectSync_$Source" | Out-Null
}

Write-Host "Automatic GitHub Sync Started!" -ForegroundColor Green
Write-Host "Watching: $ProjectPath"
Write-Host "Save a file with Ctrl+S to sync. Press Ctrl+C to stop."

$Pending = $false
$LastChange = Get-Date

try {
    while ($true) {
        $Events = Get-Event | Where-Object {
            $_.SourceIdentifier -like "ProjectSync_*"
        }

        foreach ($Event in $Events) {
            $Path = [string]$Event.SourceEventArgs.FullPath

            Remove-Event -EventIdentifier $Event.EventIdentifier

            if ($Path -match '[\\/](\.git|\.venv|__pycache__|\.ipynb_checkpoints)[\\/]' -or
                $Path -match '[\\/]\.env($|\.)' -or
                $Path -match '\.(tmp|temp|swp)$') {
                continue
            }

            $Pending = $true
            $LastChange = Get-Date
        }

        if ($Pending -and
            ((Get-Date) - $LastChange).TotalSeconds -ge $DebounceSeconds) {

            Write-Host "Changes detected. Uploading..." -ForegroundColor Yellow

            git add -A

            if ($LASTEXITCODE -ne 0) {
                Write-Host "Git staging failed." -ForegroundColor Red
            }
            else {
                git diff --cached --quiet

                if ($LASTEXITCODE -eq 1) {
                    $Message = "Automatic update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

                    git commit -m $Message

                    if ($LASTEXITCODE -eq 0) {
                        git push origin $Branch

                        if ($LASTEXITCODE -eq 0) {
                            Write-Host "GitHub updated successfully!" -ForegroundColor Green
                        }
                        else {
                            Write-Host "Push failed. Check your internet or GitHub login." -ForegroundColor Red
                        }
                    }
                }
                elseif ($LASTEXITCODE -ne 0) {
                    Write-Host "Could not check staged changes." -ForegroundColor Red
                }
            }

            $Pending = $false
        }

        Start-Sleep -Milliseconds 500
    }
}
finally {
    $Watcher.EnableRaisingEvents = $false
    $Watcher.Dispose()

    foreach ($Source in $Sources) {
        Unregister-Event -SourceIdentifier "ProjectSync_$Source" -ErrorAction SilentlyContinue
    }

    Write-Host "Automatic synchronization stopped."
}
