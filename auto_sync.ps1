
$ProjectPath = "D:\Mobile-Price-Range-Classification"
$LastStatus = ""
$LastChangeTime = Get-Date

Set-Location $ProjectPath

Write-Host "Automatic GitHub Sync Started..." -ForegroundColor Green
Write-Host "Monitoring project files. Press Ctrl+C to stop."

while ($true) {
    $CurrentStatus = git status --porcelain

    if ($CurrentStatus -ne $LastStatus) {
        $LastStatus = $CurrentStatus
        $LastChangeTime = Get-Date
    }

    if ($CurrentStatus -ne "" -and
        ((Get-Date) - $LastChangeTime).TotalSeconds -ge 5) {

        git add -A

        $StagedChanges = git diff --cached --quiet
        if ($LASTEXITCODE -ne 0) {
            $CommitMessage = "Automatic update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

            git commit -m $CommitMessage

            if ($LASTEXITCODE -eq 0) {
                git push

                if ($LASTEXITCODE -eq 0) {
                    Write-Host "GitHub updated successfully!" -ForegroundColor Green
                }
                else {
                    Write-Host "Push failed. Check your connection." -ForegroundColor Red
                }
            }
        }

        $LastStatus = git status --porcelain
        $LastChangeTime = Get-Date
    }

    Start-Sleep -Seconds 2
}
