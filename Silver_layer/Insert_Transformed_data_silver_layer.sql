

TRUNCATE TABLE Silver.AutoInsurance_info;
		PRINT '>> Inserting Data Into: Silver.AutoInsurance_info';

INSERT INTO silver.AutoInsurance_info (
		veh_value,
		exposure,
		clm,
		numclaims,
		Claims_Cost,
		veh_body,
		veh_age,
		gender,
		area,
		agecat,
		severity,
		Pure_Risk_premium
	)

SELECT  
	veh_value *10000 AS veh_value,
	exposure,
	clm,
	numclaims,
	claimcst0 AS Claims_Cost,
	veh_body,
	veh_age,
	CASE 
		WHEN gender ='F' THEN 'Female'
		WHEN gender ='M' THEN 'Male'
		ELSE 'N/A'
	END AS Gender,
	area,
	agecat,
	ISNULL(claimcst0/NULLIF(numclaims,0),0) AS severity,
	 claimcst0/exposure AS Pure_Risk_premium

FROM bronze.AutoInsurance_info
WHERE veh_value >0;
  

SELECT * FROM silver.AutoInsurance_info;