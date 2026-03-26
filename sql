CLEANING SCRIPT
  
  
  CREATE OR REPLACE TABLE 
  `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims_cleaned` AS
SELECT
    -- TEXT COLUMNS
    COALESCE(NULLIF(LOWER(TRIM(age_group)), ''), 'unknown') AS age_group,
    COALESCE(NULLIF(LOWER(TRIM(bmi_category)), ''), 'unknown') AS bmi_category,
    COALESCE(NULLIF(LOWER(TRIM(children_group)), ''), 'unknown') AS children_group,
    COALESCE(NULLIF(LOWER(TRIM(gender)), ''), 'unknown') AS gender,
    COALESCE(NULLIF(LOWER(TRIM(region)), ''), 'unknown') AS region,

    -- FLAGS
    SAFE_CAST(smoker_flag AS INT64) AS smoker_flag,
    SAFE_CAST(diabetic_flag AS INT64) AS diabetic_flag,

    -- NUMERIC FIELDS
    SAFE_CAST(age AS INT64) AS age,
    SAFE_CAST(bloodpressure AS FLOAT64) AS bloodpressure,
    SAFE_CAST(bmi AS FLOAT64) AS bmi,
    SAFE_CAST(bmi_smoker_interaction AS FLOAT64) AS bmi_smoker_interaction,
    SAFE_CAST(children AS INT64) AS children,
    SAFE_CAST(children_smoker_interaction AS FLOAT64) AS children_smoker_interaction,
    SAFE_CAST(claim AS FLOAT64) AS claim,
    SAFE_CAST(risk_score AS FLOAT64) AS risk_score,
    SAFE_CAST(age_diabetic_interaction AS FLOAT64) AS age_diabetic_interaction,
    SAFE_CAST(region_code AS INT64) AS region_code,
    SAFE_CAST(PatientID AS INT64) AS patient_id,
    SAFE_CAST(index AS INT64) AS index_value,

    -- BOOLEAN TEXT FIELDS
    LOWER(CAST(smoker AS STRING)) AS smoker,
   LOWER(CAST(diabetic AS STRING)) AS diabetic

FROM 
  `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`;





analysis_pack.sql

-- ============================================================
-- PROJECT 3: INSURANCE DEMOGRAPHIC CLAIMS ANALYSIS
-- ANALYSIS PACK (BigQuery SQL)
-- Dataset: my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims
-- ============================================================

-- 1. BASIC ROW COUNT
SELECT COUNT(*) AS total_rows
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`;

-- 2. SUMMARY STATISTICS FOR NUMERIC FIELDS
SELECT
  AVG(age) AS avg_age,
  AVG(bmi) AS avg_bmi,
  AVG(bloodpressure) AS avg_bloodpressure,
  AVG(claim) AS avg_claim,
  MIN(claim) AS min_claim,
  MAX(claim) AS max_claim,
  STDDEV(claim) AS std_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`;

-- 3. CLAIMS BY AGE GROUP
SELECT
  age_group,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim,
  SUM(claim) AS total_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY age_group
ORDER BY avg_claim DESC;

-- 4. CLAIMS BY BMI CATEGORY
SELECT
  bmi_category,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY bmi_category
ORDER BY avg_claim DESC;

-- 5. SMOKER VS NON-SMOKER CLAIM DIFFERENCE
SELECT
  smoker,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim,
  SUM(claim) AS total_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY smoker
ORDER BY avg_claim DESC;

-- 6. DIABETIC VS NON-DIABETIC CLAIM DIFFERENCE
SELECT
  diabetic,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY diabetic
ORDER BY avg_claim DESC;

-- 7. CLAIMS BY REGION
SELECT
  region,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim,
  SUM(claim) AS total_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY region
ORDER BY avg_claim DESC;

-- 8. CHILDREN GROUP IMPACT ON CLAIMS
SELECT
  children_group,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY children_group
ORDER BY avg_claim DESC;

-- 9. RISK SCORE CORRELATION
SELECT
  CORR(risk_score, claim) AS corr_risk_claim,
  CORR(bmi, claim) AS corr_bmi_claim,
  CORR(age, claim) AS corr_age_claim,
  CORR(bloodpressure, claim) AS corr_bp_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`;

-- 10. INTERACTION TERM IMPACT
SELECT
  AVG(bmi_smoker_interaction) AS avg_bmi_smoker_interaction,
  AVG(children_smoker_interaction) AS avg_children_smoker_interaction,
  AVG(age_diabetic_interaction) AS avg_age_diabetic_interaction,
  CORR(bmi_smoker_interaction, claim) AS corr_bmi_smoker_claim,
  CORR(children_smoker_interaction, claim) AS corr_children_smoker_claim,
  CORR(age_diabetic_interaction, claim) AS corr_age_diabetic_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`;

-- 11. TOP 10 HIGHEST CLAIMS
SELECT
  PatientID,
  age,
  gender,
  bmi,
  bloodpressure,
  smoker,
  diabetic,
  region,
  claim,
  risk_score
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
ORDER BY claim DESC
LIMIT 10;

-- 12. CLAIM DISTRIBUTION BY GENDER
SELECT
  gender,
  COUNT(*) AS count_records,
  AVG(claim) AS avg_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY gender
ORDER BY avg_claim DESC;

-- 13. AGE GROUP + BMI CATEGORY HEATMAP
SELECT
  age_group,
  bmi_category,
  AVG(claim) AS avg_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY age_group, bmi_category
ORDER BY age_group, bmi_category;

-- 14. REGION + CHILDREN GROUP HEATMAP
SELECT
  region,
  children_group,
  AVG(claim) AS avg_claim
FROM `my-healthcare-project-487800.Insurance_claim_Analysis_Demographic_Project3.engineered_claims`
GROUP BY region, children_group
ORDER BY region, children_group;

-- ============================================================
-- END OF ANALYSIS PACK
-- ============================================================


