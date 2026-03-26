# insurance-demographic-claims-project3

# Insurance Demographic Claims Analysis  
### End‑to‑End SQL + BigQuery + Tableau Project

This project analyzes how demographic, lifestyle, and health factors influence medical insurance claim costs.  
It follows a full analytics workflow used in real healthcare data teams: data cleaning, feature engineering, SQL analysis, and interactive Tableau dashboards.

The goal is to identify the strongest predictors of high claim amounts and build a reusable, scalable analytics pipeline.

---

## 📌 Project Overview

This project uses a synthetic insurance demographic dataset containing:

- Age  
- Gender  
- BMI  
- Blood pressure  
- Smoking status  
- Diabetes status  
- Number of children  
- Region  
- Claim amount  

The analysis focuses on:

- Risk segmentation  
- Cost drivers  
- Interaction effects  
- Regional differences  
- High‑risk customer profiles  

All work is performed using **BigQuery SQL** and visualized in **Tableau**.

---

## 🧱 Project Architecture
-----------------------------------------------------------------


This structure mirrors real analytics workflows and supports reproducibility.

---

## 🧼 Data Cleaning

The cleaning script standardizes:

- Numeric fields (age, BMI, blood pressure, claim)
- Boolean fields (smoker, diabetic)
- Categorical fields (gender, region)
- Whitespace and casing inconsistencies

**File:** `sql/cleaning.sql`  
**Output Table:** `cleaned_claims`

---

## 🧩 Feature Engineering

Engineered fields include:

### Groupings
- `age_group`  
- `bmi_category`  
- `children_group`  

### Flags
- `smoker_flag`  
- `diabetic_flag`  
- `region_code`  

### Interaction Terms
- `bmi_smoker_interaction`  
- `age_diabetic_interaction`  
- `children_smoker_interaction`  

### Composite Risk Score
A weighted score combining BMI, smoking, diabetes, age, and blood pressure.

**Output Table:** `engineered_claims`

---

## 📊 SQL Analysis

The analysis pack includes:

- Summary statistics  
- Claim distribution by demographic groups  
- Risk score correlations  
- Interaction term impact  
- Heatmaps (age × BMI, region × children)  
- Top 10 highest‑claim customers  

**File:** `sql/analysis_pack.sql`

---

## 📈 Tableau Dashboard

The Tableau dashboard visualizes:

- Claim distribution  
- Risk segmentation  
- Smoker vs non‑smoker cost differences  
- Regional claim patterns  
- High‑risk customer profiles  

(Insert your Tableau Public link here once published.)

---

## 📁 Repository Structure

-----------------------------------------------------------------------------


---

## 🧠 Key Insights

- **Smoking** is the strongest cost driver.  
- **BMI** and obesity significantly increase claim amounts.  
- **Diabetes** amplifies risk, especially for older customers.  
- **Seniors** have the highest average claims.  
- **Region** influences claim behavior even with similar demographics.  
- **Risk score** strongly correlates with claim cost.  

Full details are in:  
`docs/insights_summary.md`

---

## 🛠️ Tools & Technologies

- **BigQuery SQL**  
- **Tableau**  
- **GitHub**  
- **Data Cleaning & Feature Engineering**  
- **Statistical Analysis**  

---

## 👤 Author

**Tarik Smith**  
Business Strategist & Data Analyst  
Focused on SQL, analytics workflows, and operational decision systems.

---

## 📬 Contact

(Insert LinkedIn or portfolio link here if you want.)


