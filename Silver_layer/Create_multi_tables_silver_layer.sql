/*
=============================================================
Create Multi Tables
=============================================================
Script Purpose:
    This script creates a new Multi Tables in the silver layer for the DB named 'ProjectDataWarehouse' after checking if it already exists. 
    If the Tables exists, it is dropped and recreated.
	
    The TWO New Tables are : 'AutoInsurance_NoClaimsData_info', 'AutoInsurance_IncurredClaims_info'.
	
WARNING:
    Running this script will drop the entire 'Tables' if it exists. 
    All data in the Tables will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

----=====================================-----
IF OBJECT_ID('silver.AutoInsurance_NoClaimsData_info', 'U') IS NOT NULL
    DROP TABLE silver.AutoInsurance_NoClaimsData_info;
GO

CREATE TABLE silver.AutoInsurance_NoClaimsData_info (
veh_value  FLOAT,
exposure FLOAT,
clm  INT,
numclaims INT,
claimcst0 FLOAT,
veh_body NVARCHAR(50),
veh_age  NVARCHAR(50),
gender  NVARCHAR(100),
area  NVARCHAR(100),
agecat NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
SELECT * FROM silver.AutoInsurance_NoClaimsData_info;


----=====================================-----
IF OBJECT_ID('silver.AutoInsurance_IncurredClaims_info', 'U') IS NOT NULL
    DROP TABLE silver.AutoInsurance_IncurredClaims_info;
GO

CREATE TABLE silver.AutoInsurance_IncurredClaims_info (
veh_value  FLOAT,
exposure FLOAT,
clm  INT,
numclaims INT,
claimcst0 FLOAT,
veh_body NVARCHAR(50),
veh_age  NVARCHAR(50),
gender  NVARCHAR(100),
area  NVARCHAR(100),
agecat NVARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
SELECT * FROM silver.AutoInsurance_IncurredClaims_info;