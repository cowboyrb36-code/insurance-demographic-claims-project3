# Methodology  
## End-to-End Analytics Workflow

This project follows a structured, industry-standard analytics workflow designed to mirror real healthcare data analysis practices.

---

## 1. Data Ingestion
The raw dataset was imported into BigQuery under:

`my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3`

The table contained demographic, lifestyle, and health-related attributes for insurance customers.

---

## 2. Data Cleaning (SQL)
Cleaning steps included:

- Standardizing column names  
- Handling nulls and inconsistent values  
- Normalizing categorical fields  
- Validating numeric ranges (age, BMI, blood pressure)  
- Ensuring boolean fields were properly typed  

All cleaning logic is stored in:

