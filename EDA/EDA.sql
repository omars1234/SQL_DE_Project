USE ProjectDataWarehouse;

SELECT veh_value,claimcst0,exposure FROM silver.AutoInsurance_info;
SELECT  MIN(veh_value) AS Min_Sum_Insured ,MAX(veh_value) AS Max_Sum_Insured,AVG(veh_value) AS Average_Sum_Insured FROM silver.AutoInsurance_info;
SELECT  MIN(claimcst0) AS Min_claims,MAX(claimcst0) AS Max_claims,AVG(claimcst0)AS Average_Sum_claims FROM silver.AutoInsurance_info;
SELECT  MIN(exposure)  AS Min_exposure,MAX(exposure) AS Max_exposure,AVG(exposure)AS Average_Sum_exposure FROM silver.AutoInsurance_info;


-- Basic EDA By Category 
SELECT 'total_records' AS MEASURE_NAME, COUNT(gender) AS MEASURE_VALUE FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT gender)  FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'records without Claims', COUNT(gender)  FROM  silver.AutoInsurance_info where clm=0
UNION ALL
SELECT 'records with Claims', COUNT(gender)  FROM  silver.AutoInsurance_info where clm=1
UNION ALL
SELECT  'Claims Count for gender' + ' : ' + gender,COUNT(gender)  FROM  silver.AutoInsurance_info where clm=1 GROUP BY gender;




SELECT 'total_records' AS MEASURE_NAME, COUNT(area) AS MEASURE_VALUE FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT area)  FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'records without Claims', COUNT(area)  FROM  silver.AutoInsurance_info where clm=0
UNION ALL
SELECT 'records with Claims', COUNT(area)  FROM  silver.AutoInsurance_info where clm=1
UNION ALL
SELECT  'Claims Count for Area' + ' : ' + area,COUNT(area)  FROM  silver.AutoInsurance_info where clm=1 GROUP BY area;


SELECT 'total_records' AS MEASURE_NAME, COUNT(veh_body) AS MEASURE_VALUE FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT veh_body)  FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'records without Claims', COUNT(veh_body)  FROM  silver.AutoInsurance_info where clm=0
UNION ALL
SELECT 'records with Claims', COUNT(veh_body)  FROM  silver.AutoInsurance_info where clm=1
UNION ALL
SELECT  'Claims Count for veh_body' + ' : ' + veh_body,COUNT(veh_body)  FROM  silver.AutoInsurance_info where clm=1 GROUP BY veh_body ORDER BY COUNT(veh_body) DESC;


SELECT 'total_records' AS MEASURE_NAME, COUNT(veh_age) AS MEASURE_VALUE FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT veh_age)  FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'records without Claims', COUNT(veh_age)  FROM  silver.AutoInsurance_info where clm=0
UNION ALL
SELECT 'records with Claims', COUNT(veh_age)  FROM  silver.AutoInsurance_info where clm=1
UNION ALL
SELECT  'Claims Count for veh_age' + ' : ' + veh_age,COUNT(veh_age)  FROM  silver.AutoInsurance_info where clm=1 GROUP BY veh_age ORDER BY COUNT(veh_age) DESC;


SELECT 'total_records' AS MEASURE_NAME, COUNT(agecat) AS MEASURE_VALUE FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT agecat)  FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'records without Claims', COUNT(agecat)  FROM  silver.AutoInsurance_info where clm=0
UNION ALL
SELECT 'records with Claims', COUNT(agecat)  FROM  silver.AutoInsurance_info where clm=1
UNION ALL
SELECT  'Claims Count for agecat' + ' : ' + agecat,COUNT(agecat)  FROM  silver.AutoInsurance_info where clm=1 GROUP BY agecat ORDER BY COUNT(agecat) DESC;

