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
