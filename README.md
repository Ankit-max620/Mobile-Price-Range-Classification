# Mobile Price Range Classification

**A Machine Learning Project for Predicting Mobile Phone Price Categories**

---

## 1. Project Overview

Mobile Price Range Classification is a supervised machine learning project that focuses on predicting the price category of a mobile phone based on its technical specifications and hardware features.

Today, smartphones are available in different price segments, with each device offering a different combination of features, performance, and specifications. Factors such as RAM, battery capacity, processor speed, internal memory, camera quality, screen resolution, and connectivity can influence the price category of a mobile phone.

The main objective of this project is to understand the relationship between these technical specifications and mobile phone price categories by using data analysis and machine learning techniques.

For this purpose, the project uses two datasets: `train.csv` and `test.csv`. The training dataset contains mobile phone specifications along with their corresponding price categories, while the testing dataset contains mobile phone specifications without the target price category.

Using the training data, different classification algorithms will be developed and evaluated to identify a suitable model. The selected model will then be used to predict the price categories of mobile phones in the testing dataset.

Unlike a regression problem that predicts an exact numerical price, this project focuses on classification. It assigns each mobile phone to one of four predefined price categories: 0, 1, 2, or 3.

The project follows a structured machine learning workflow, covering data understanding, exploratory data analysis, data preprocessing, feature analysis, model training, model evaluation, and prediction.

## 2. Project Objectives

The primary objectives of this project are:

- **Dataset Understanding:** Explore both training and testing datasets to understand their structure, features, data types, and purpose.
- **Exploratory Data Analysis (EDA):** Analyze mobile phone specifications using statistical methods to identify patterns, distributions, and relationships.
- **Data Visualization:** Create meaningful charts and graphs to understand how mobile phone features relate to different price categories.
- **Data Quality Analysis:** Check for missing values, duplicate records, unusual values, and other potential data quality issues.
- **Data Preprocessing:** Prepare the dataset for machine learning by selecting relevant features and applying suitable preprocessing techniques where required.
- **Feature Analysis:** Study the importance and relationship of different mobile phone specifications with the target variable.
- **Model Development:** Implement and train suitable machine learning classification algorithms.
- **Model Evaluation:** Compare model performance using accuracy, precision, recall, F1-score, and confusion matrix.
- **Price Category Prediction:** Use the trained model to predict the price categories of unseen mobile phone records.
- **Application Development:** Develop a simple prediction interface using Flask as a planned extension of the project.

## 3. Dataset Description

This project uses the Mobile Price Classification dataset, which is divided into two CSV files:

1. `train.csv` – Training dataset
2. `test.csv` – Testing dataset

Both datasets contain mobile phone specifications, including battery capacity, RAM, processor speed, camera resolution, screen dimensions, memory, and connectivity features.

### 3.1 Training Dataset – train.csv

The training dataset contains **2,000 records and 21 columns**.

It includes 20 independent features describing mobile phone specifications and one target variable named `price_range`.

The `price_range` column represents the price category of each mobile phone. This column is used by the machine learning model to learn the relationship between mobile phone specifications and their respective price categories.

### 3.2 Testing Dataset – test.csv

The testing dataset contains **1,000 records and 21 columns**.

It contains the same 20 mobile phone specification features as the training dataset, along with an additional `id` column.

The testing dataset does not contain the `price_range` column. It will be used after model training to generate predictions for mobile phone records whose price categories are unknown.

The `id` column is used only to identify individual records and will not be treated as a mobile phone feature during model training.

### 3.3 Dataset Summary

| Dataset | Number of Records | Number of Columns | Target Variable |
|---|---:|---:|---|
| train.csv | 2,000 | 21 | price_range |
| test.csv | 1,000 | 21 | Not available |

**Total records:** 3,000 mobile phone records across both datasets.

### 3.4 Feature Description

The datasets contain the following mobile phone specifications:

| Feature | Description |
|---|---|
| `battery_power` | Total battery capacity of the mobile phone. |
| `blue` | Indicates whether the phone supports Bluetooth. |
| `clock_speed` | Speed at which the phone's processor operates. |
| `dual_sim` | Indicates whether the phone supports dual SIM functionality. |
| `fc` | Resolution of the front camera. |
| `four_g` | Indicates whether the phone supports 4G connectivity. |
| `int_memory` | Internal storage capacity of the mobile phone. |
| `m_dep` | Mobile depth or thickness of the device. |
| `mobile_wt` | Weight of the mobile phone. |
| `n_cores` | Number of processor cores. |
| `pc` | Resolution of the primary or rear camera. |
| `px_height` | Pixel height of the screen resolution. |
| `px_width` | Pixel width of the screen resolution. |
| `ram` | Random Access Memory available in the mobile phone. |
| `sc_h` | Screen height of the mobile phone. |
| `sc_w` | Screen width of the mobile phone. |
| `talk_time` | Maximum time the phone can be used for calls on a single battery charge. |
| `three_g` | Indicates whether the phone supports 3G connectivity. |
| `touch_screen` | Indicates whether the phone has touchscreen functionality. |
| `wifi` | Indicates whether the phone supports Wi-Fi connectivity. |

### 3.5 Target Variable – price_range

The target variable is `price_range`, which is available only in the training dataset.

It contains four classification categories:

| Class Label | Category |
|---:|---|
| 0 | Lowest price range |
| 1 | Medium-low price range |
| 2 | Medium-high price range |
| 3 | Highest price range |

The classification model will learn from these four categories and use the mobile phone specifications to predict the appropriate category for unseen records.

**Note:** These labels represent price categories, not exact selling prices or fixed currency ranges.

## 4. Technologies and Tools Used

The project uses Python and its data science and machine learning libraries.

| Technology / Tool | Purpose |
|---|---|
| Python | Main programming language used to develop the project. |
| Pandas | Loading, exploring, cleaning, and manipulating datasets. |
| NumPy | Numerical operations and mathematical calculations. |
| Scikit-learn | Data preprocessing, classification algorithms, model training, and evaluation. |
| Matplotlib | Creating charts and visual representations of data. |
| Seaborn | Creating statistical visualizations and exploring relationships between features. |
| Jupyter Notebook | Performing exploratory data analysis and experimenting with the dataset. |
| Flask | Developing a web interface for making mobile price category predictions. |
| Git | Tracking changes and managing project versions. |
| GitHub | Hosting and maintaining the project repository. |
| Zed Editor | Writing and managing project code. |

**Development Environment:** Windows 11, Python 3.13.14, and an isolated Python virtual environment (`.venv`).

## 5. Project Workflow

The project follows a structured machine learning development process.

### Step 1: Environment Setup

Configure the development environment, install Python libraries, create a virtual environment, and organize the project into separate folders and modules.

### Step 2: Data Ingestion

Load `train.csv` and `test.csv` into Python using Pandas. Organize the raw datasets and check whether they have been loaded correctly.

### Step 3: Exploratory Data Analysis (EDA)

Explore the training dataset to understand its structure, feature distributions, statistical summaries, and relationships between mobile phone specifications and price categories.

Create visualizations such as histograms, count plots, box plots, scatter plots, and correlation heatmaps.

### Step 4: Data Quality Analysis

Examine the datasets for missing values, duplicate records, incorrect data types, unusual values, and other potential data quality problems.

### Step 5: Data Preprocessing

Prepare the data for machine learning. Separate independent features from the target variable, apply suitable preprocessing techniques, and ensure that training and testing data use a consistent feature structure.

### Step 6: Feature Analysis

Analyze how different mobile phone specifications contribute to price classification. Identify important features and understand which specifications provide useful information for the prediction task.

### Step 7: Model Training

Train suitable supervised machine learning classification algorithms using the training dataset.

Possible algorithms include:

- Logistic Regression
- Decision Tree Classifier
- Random Forest Classifier
- K-Nearest Neighbors (KNN)
- Support Vector Machine (SVM)

The algorithms will be evaluated to identify a suitable classification model.

### Step 8: Model Evaluation

Evaluate the trained models using appropriate classification metrics, including:

- Accuracy
- Precision
- Recall
- F1-score
- Confusion Matrix

Compare the results to understand how well each model classifies mobile phones into the four price categories.

### Step 9: Prediction Pipeline

Develop a reusable prediction pipeline that accepts mobile phone specifications, applies the same preprocessing steps used during training, and generates a predicted price category.

### Step 10: Application Development

As a planned extension, use Flask to develop a simple web application where users can enter mobile phone specifications and receive a predicted price category.

## 6. Project Structure

The project follows a modular machine learning architecture. Each component has a separate responsibility, making the code easier to understand, maintain, test, and reuse.

```text
Mobile-Price-Range-Classification/
│
├── data/
│   └── raw/
│       ├── train.csv
│       └── test.csv
│
├── notebooks/
│   └── 01_eda.ipynb
│
├── src/
│   ├── components/
│   │   ├── data_ingestion.py
│   │   ├── data_transformation.py
│   │   └── model_trainer.py
│   │
│   ├── pipeline/
│   │   ├── train_pipeline.py
│   │   └── predict_pipeline.py
│   │
│   ├── __init__.py
│   ├── exception.py
│   └── logger.py
│
├── requirements.txt
├── README.md
└── .gitignore
```

### Folder and File Explanation

- **data/raw/** – Stores the original training and testing CSV files.
- **notebooks/** – Contains Jupyter notebooks for exploratory data analysis and experimentation.
- **src/components/** – Contains separate Python modules for data ingestion, data transformation, and model training.
- **src/pipeline/** – Contains the training and prediction pipeline scripts.
- **src/logger.py** – Handles logging information during project execution.
- **src/exception.py** – Provides a common structure for handling project errors.
- **requirements.txt** – Lists the Python libraries required to run the project.
- **README.md** – Provides project documentation and instructions.
- **.gitignore** – Specifies files and folders that should not be tracked by Git.

## 7. Expected Outcomes

The expected outcome is a machine learning classification system that can analyze mobile phone specifications and predict one of four predefined price categories.

The project is also expected to provide useful insights into the relationship between mobile phone hardware specifications and their price segments through exploratory data analysis and visualizations.

By comparing different classification algorithms, the project aims to identify a suitable model based on its evaluation results.

The final planned system will include a reusable prediction pipeline and may be extended into a Flask-based web application for making predictions through a simple user interface.

## 8. Learning Outcomes

Through this project, I aim to gain practical knowledge and experience in the following areas:

- Understanding and working with structured datasets.
- Using Pandas and NumPy for data analysis and manipulation.
- Performing exploratory data analysis on real-world data.
- Creating meaningful data visualizations.
- Identifying data quality issues and preparing datasets for machine learning.
- Understanding the relationship between independent features and target variables.
- Applying different supervised machine learning classification algorithms.
- Evaluating models using appropriate performance metrics.
- Building modular and reusable Python programs.
- Developing data ingestion, training, and prediction pipelines.
- Understanding how machine learning models can be integrated into web applications.
- Managing project development and version history using Git and GitHub.

## 9. Future Improvements

After completing the main classification workflow, the project can be extended with additional features:

- Experiment with additional classification algorithms and hyperparameter tuning.
- Improve model performance through feature selection and suitable preprocessing techniques.
- Develop an interactive Flask-based prediction application.
- Add visual representations of model performance and feature importance.
- Save the trained model and preprocessing objects for future predictions.
- Improve the application interface to make predictions easier for users.

## 10. Conclusion

Mobile Price Range Classification is a practical machine learning project that explores how mobile phone specifications can be used to identify different price categories.

Using separate training and testing datasets, the project focuses on understanding mobile phone features, performing exploratory data analysis, preparing the data, developing classification models, and evaluating their performance.

The project also emphasizes writing clean and modular Python code, organizing the machine learning workflow, and developing a reusable prediction system.

Overall, this project provides an opportunity to apply data analysis and machine learning concepts to a real-world classification problem while developing practical skills in Python, data visualization, model development, and project management.

---

**Project Name:** Mobile Price Range Classification  
**Domain:** Data Science and Machine Learning  
**Problem Type:** Supervised Machine Learning – Multiclass Classification  
**Programming Language:** Python  
**Dataset Files:** `train.csv` and `test.csv`  
**Target Variable:** `price_range`  
**Number of Price Categories:** 4  
**Development Environment:** Zed Editor and Python Virtual Environment  
**Version Control:** Git and GitHub
