# Project Overview  
## Insurance Demographic Claims Analysis (Project 3)

This project analyzes demographic and behavioral factors that influence medical insurance claim amounts.  
The dataset contains 1,338 customer records with demographic, lifestyle, and engineered risk features.  
The goal is to identify the strongest predictors of high claim costs and provide insights that support pricing, underwriting, and risk‑management decisions.

### 🎯 Objectives
- Understand how age, BMI, smoking status, diabetes, and region impact claim amounts  
- Quantify risk using engineered interaction terms and a composite risk score  
- Build SQL-driven insights that align with Tableau visualizations  
- Produce a recruiter-ready analytics workflow demonstrating data cleaning, feature engineering, and business interpretation  

### 📦 Dataset
Source: BigQuery  
Table:  
`my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`

### 🧩 Key Features
- **Demographics:** age, gender, region  
- **Health indicators:** BMI, blood pressure, diabetic  
- **Lifestyle:** smoker, children  
- **Engineered features:**  
  - age_group  
  - bmi_category  
  - children_group  
  - smoker_flag / diabetic_flag  
  - region_code  
  - bmi_smoker_interaction  
  - age_diabetic_interaction  
  - children_smoker_interaction  
  - risk_score  

### 🛠 Tools Used
- **BigQuery SQL** (cleaning, feature engineering, analysis)  
- **Tableau** (visual analytics and dashboards)  
- **GitHub** (version control and project documentation)

This project demonstrates a complete analytics workflow from raw data to insights, structured for hiring managers and technical reviewers.
