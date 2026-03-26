# Insights Summary  
## Key Findings from the Insurance Demographic Claims Analysis

This analysis reveals clear demographic and behavioral patterns that drive medical insurance claim costs.  
The insights below combine SQL analysis with Tableau visualizations.

---

## 1. Smoking is the strongest cost driver
- Smokers have significantly higher average claims than non-smokers.  
- The bmi_smoker_interaction term shows a strong positive correlation with claim amounts.  
- Smoking combined with high BMI produces the highest-risk customer segment.

### Business Impact
- Smoking status should remain a primary pricing factor.  
- High-BMI smokers may require targeted risk‑mitigation programs.

---

## 2. BMI and obesity strongly influence claim amounts
- Obese customers show the highest average claims across all BMI categories.  
- BMI correlates positively with claim cost.  

### Business Impact
- Weight‑management incentives could reduce long‑term claim exposure.  
- BMI should remain a core component of risk scoring.

---

## 3. Age increases claim cost, especially for seniors
- Seniors have the highest average claims.  
- The age_diabetic_interaction term shows elevated risk for older diabetic customers.

### Business Impact
- Senior diabetic customers represent a high‑cost segment.  
- Preventive care programs could reduce long-term expenses.

---

## 4. Diabetes increases claim amounts
- Diabetic customers consistently show higher average claims.  
- Diabetes combined with age or smoking amplifies risk.

### Business Impact
- Diabetes management programs could reduce claim volatility.  
- Diabetic_flag and age_diabetic_interaction should be included in pricing models.

---

## 5. Region influences claim behavior
- Certain regions show higher average claims despite similar demographics.  
- Region_code helps quantify geographic risk differences.

### Business Impact
- Regional pricing adjustments may be justified.  
- Further investigation into provider costs by region is recommended.

---

## 6. Children impact claim cost in predictable ways
- Customers with 3+ children show slightly higher average claims.  
- The children_smoker_interaction term identifies high‑risk households.

### Business Impact
- Family plans may require adjusted pricing for high‑risk combinations.

---

## 7. Risk Score is a strong predictor of claim cost
- Higher risk_score values correlate strongly with higher claim amounts.  
- Customers with risk_score ≥ 4 represent the top cost tier.

### Business Impact
- The risk score can be used for underwriting, pricing, and customer segmentation.

---

## Final Summary
The strongest predictors of high claim amounts are:

1. Smoking  
2. BMI (especially obese category)  
3. Diabetes  
4. Age (especially seniors)  
5. Interaction terms combining lifestyle + health factors  
6. Region-level differences  

These insights support more accurate pricing models, targeted health interventions, and improved risk management strategies.
