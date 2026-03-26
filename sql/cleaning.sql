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
