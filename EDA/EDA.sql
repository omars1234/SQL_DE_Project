USE ProjectDataWarehouse;

-- =============================================================================
SELECT * FROM INFORMATION_SCHEMA.TABLES;
-- =============================================================================
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;
-- =============================================================================
SELECT * FROM gold.AutoInsurance_info;
-- =============================================================================

-- =============================================================================
--*********************Dimensions Exploration*********************
-- =============================================================================

-- Basic EDA By Category 

-- gender Dimension :
SELECT 'total_records' AS MEASURE_NAME, COUNT(gender) AS MEASURE_VALUE FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT gender)  FROM  gold.AutoInsurance_info
UNION ALL
SELECT  'Count for gender' + ' : ' + gender,COUNT(gender)  FROM  gold.AutoInsurance_info GROUP BY gender;

-- =============================================================================
-- area Dimension :
SELECT 'total_records' AS MEASURE_NAME, COUNT(area) AS MEASURE_VALUE FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT area)  FROM  gold.AutoInsurance_info
UNION ALL
SELECT  'Count for area' + ' : ' + area,COUNT(area)  FROM  gold.AutoInsurance_info GROUP BY area;

-- =============================================================================
-- veh_age Dimension :
SELECT 'total_records' AS MEASURE_NAME, COUNT(veh_age) AS MEASURE_VALUE FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT veh_age)  FROM  gold.AutoInsurance_info
UNION ALL
SELECT  'Count for veh_age' + ' : ' + veh_age,COUNT(veh_age)  FROM  gold.AutoInsurance_info  GROUP BY veh_age ;

-- =============================================================================
-- agecat Dimension :
SELECT 'total_records' AS MEASURE_NAME, COUNT(agecat) AS MEASURE_VALUE FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT agecat)  FROM  gold.AutoInsurance_info
UNION ALL
SELECT  'Count for agecat' + ' : ' + agecat,COUNT(agecat)  FROM  gold.AutoInsurance_info GROUP BY agecat;

-- =============================================================================
-- veh_body Dimension :
SELECT 'total_records' AS MEASURE_NAME, COUNT(veh_body) AS MEASURE_VALUE FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'total_distinct_records', COUNT(DISTINCT veh_body)  FROM  gold.AutoInsurance_info
UNION ALL
SELECT  'Count for veh_body' + ' : ' + veh_body,COUNT(veh_body)  FROM  gold.AutoInsurance_info GROUP BY veh_body;



-- =============================================================================
--*********************Measures Exploration*********************
-- =============================================================================

SELECT 'Claims_Cost' AS MEASURE_NAME,MIN(Claims_Cost) AS MIN_,
MAX(Claims_Cost) AS MAX_,ROUND(AVG(Claims_Cost),0) AVG_
FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'exposure',MIN(exposure) ,MAX(exposure) ,ROUND(AVG(exposure),0) FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'veh_value', MIN(veh_value) , MAX(veh_value) ,ROUND(AVG(veh_value),0) FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'severity',MIN(severity) ,MAX(severity) ,ROUND(AVG(severity),0) FROM  gold.AutoInsurance_info
UNION ALL
SELECT 'Pure_Risk_premium',MIN(Pure_Risk_premium) ,MAX(Pure_Risk_premium) ,ROUND(AVG(Pure_Risk_premium),0) FROM  gold.AutoInsurance_info;


SELECT COUNT(*) AS Records_with_claims FROM  gold.AutoInsurance_info WHERE clm=1;
SELECT COUNT(*) AS Records_with_no_claims FROM  gold.AutoInsurance_info WHERE clm=0;


-- Basic EDA By Category in Terms of incurred/not Incurred claims

SELECT 'total_distinct_records' AS MEASURE_NAME, COUNT(DISTINCT gender) AS MEASURE_VALUE
FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'total_records', COUNT(gender)  FROM  silver.AutoInsurance_info
UNION ALL
SELECT 'records without Claims', COUNT(gender)  FROM  silver.AutoInsurance_info where clm=0
UNION ALL
SELECT 'records with Claims', COUNT(gender)  FROM  silver.AutoInsurance_info where clm=1
UNION ALL
SELECT  'Claims Count for gender' + ' : ' + gender,COUNT(gender)  FROM  silver.AutoInsurance_info where clm=1 GROUP BY gender;


SELECT  
	gender,
	COUNT(gender) AS recoreds_with_claims,
	SUM(numclaims) AS Claims_Count,
	ROUND(SUM(Claims_Cost),0) AS Total_Claims_Cost,
	ROUND(AVG(severity),0) AS Total_severity,
	ROUND(AVG(Pure_Risk_premium),0) AS Total_Pure_Risk_premium
FROM  gold.AutoInsurance_info   GROUP BY gender;

SELECT  
	area,
	COUNT(area) AS recoreds_with_claims,
	SUM(numclaims) AS Claims_Count,
	ROUND(SUM(Claims_Cost),0) AS Total_Claims_Cost,
	ROUND(AVG(severity),0) AS Total_severity,
	ROUND(AVG(Pure_Risk_premium),0) AS Total_Pure_Risk_premium
FROM  gold.AutoInsurance_info   GROUP BY area ORDER BY area;



SELECT  
	agecat,
	COUNT(agecat) AS recoreds_with_claims,
	SUM(numclaims) AS Claims_Count,
	ROUND(SUM(Claims_Cost),0) AS Total_Claims_Cost,
	ROUND(AVG(severity),0) AS Total_severity,
	ROUND(AVG(Pure_Risk_premium),0) AS Total_Pure_Risk_premium
FROM  gold.AutoInsurance_info   GROUP BY agecat ORDER BY agecat;


SELECT  
	veh_age,
	COUNT(veh_age) AS recoreds_with_claims,
	SUM(numclaims) AS Claims_Count,
	ROUND(SUM(Claims_Cost),0) AS Total_Claims_Cost,
	ROUND(AVG(severity),0) AS Total_severity,
	ROUND(AVG(Pure_Risk_premium),0) AS Total_Pure_Risk_premium
FROM  gold.AutoInsurance_info   GROUP BY veh_age ORDER BY veh_age;

SELECT  
	veh_body,
	COUNT(veh_body) AS recoreds_with_claims,
	SUM(numclaims) AS Claims_Count,
	ROUND(SUM(Claims_Cost),0) AS Total_Claims_Cost,
	ROUND(AVG(severity),0) AS Total_severity,
	ROUND(AVG(Pure_Risk_premium),0) AS Total_Pure_Risk_premium
FROM  gold.AutoInsurance_info   GROUP BY veh_body;

