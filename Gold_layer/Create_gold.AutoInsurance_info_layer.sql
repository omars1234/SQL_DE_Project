/*
=============================================================
Create gold layer table
=============================================================
Script Purpose:
    This script creates the gold layer table for the DB named 'ProjectDataWarehouse' after checking if it already exists. 
    If the Tables exists, it is dropped and recreated.
	
WARNING:
    Running this script will drop the entire 'Table' if it exists. 
    All data in the Tables will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

----=====================================-----

USE ProjectDataWarehouse;

IF OBJECT_ID('gold.AutoInsurance_info', 'U') IS NOT NULL
    DROP TABLE gold.AutoInsurance_info;
GO


CREATE VIEW gold.AutoInsurance_info AS
SELECT
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
From silver.AutoInsurance_info;
GO

SELECT * FROM gold.AutoInsurance_info