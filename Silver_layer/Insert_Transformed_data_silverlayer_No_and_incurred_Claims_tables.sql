TRUNCATE TABLE Silver.AutoInsurance_NoClaimsData_info;
		PRINT '>> Inserting Data Into: Silver.AutoInsurance_NoClaimsData_info';

INSERT INTO silver.AutoInsurance_NoClaimsData_info (
		veh_value,
		exposure,
		clm,
		numclaims,
		claimcst0,
		veh_body,
		veh_age,
		gender,
		area,
		agecat
	)

SELECT  
	veh_value *10000 AS veh_value,
	exposure,
	clm AS Claims,
	numclaims,
	claimcst0 AS Claims_Cost,
	veh_body,
	veh_age,
	gender,
	area,
	agecat
FROM silver.AutoInsurance_info
WHERE claimcst0 = 0;

----=====================================-----
SELECT * FROM silver.AutoInsurance_NoClaimsData_info;
SELECT COUNT(*) FROM silver.AutoInsurance_NoClaimsData_info;
----=====================================-----

TRUNCATE TABLE Silver.AutoInsurance_IncurredClaims_info;
		PRINT '>> Inserting Data Into: Silver.AutoInsurance_IncurredClaims_info';

INSERT INTO silver.AutoInsurance_IncurredClaims_info (
		veh_value,
		exposure,
		clm,
		numclaims,
		claimcst0,
		veh_body,
		veh_age,
		gender,
		area,
		agecat
	)

SELECT  
	veh_value *10000 AS veh_value,
	exposure,
	clm AS Claims,
	numclaims,
	claimcst0 AS Claims_Cost,
	veh_body,
	veh_age,
	gender,
	area,
	agecat
FROM silver.AutoInsurance_info
WHERE claimcst0 != 0;
