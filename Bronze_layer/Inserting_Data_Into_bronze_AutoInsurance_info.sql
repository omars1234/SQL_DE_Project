
/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
-- USE ProjectDataWarehouse;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
 DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
 SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading AutoInsurance_info Table';
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.AutoInsurance_info';
        TRUNCATE TABLE bronze.AutoInsurance_info;
		PRINT '>> Inserting Data Into: bronze.AutoInsurance_info';

        BULK INSERT bronze.AutoInsurance_info
        FROM 'C:\Users\Omar\Desktop\Omar_Files\SQL_Projects\InsuranceData_SQL_WareHouse_Project\SQL_DE_Project\Data_sets\data_car.csv'
        WITH (
			  FIRSTROW=2,
			  FIELDTERMINATOR = ',',
			  TABLOCK
			 );
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

END

EXEC bronze.load_bronze;