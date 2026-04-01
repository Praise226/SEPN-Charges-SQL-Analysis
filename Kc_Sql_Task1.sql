
-- SQL PERSONAL PROJECT TASKS
-- 1. You are required to create a database named: "SEPN_charges_db" in MySQL and then 
-- 2. Create three tables named sepn_charges_2022_23_tb, sepn_charges_2023_24_tb and sepn_charges_2024_25_tb.
-- Load the below three csv files into each tables.
-- 1. sepn_charges_2022_23.csv
-- 2. sepn_charges_2023_24.csv
-- 3. sepn_charges_2024_25.csv
-- Tasks:
-- 1. Write SQL codes to check the structures of each of the 3 tables
-- 2. Write SQL codes to display the number of records in each tables
-- 3. Write SQL codes to display the number of customers who are Non-final demand (That is customers with zero(0) values as Residual Bands for the year 2023/24 and 2024/25.
-- 4. Write SQL codes to display the number of customers who are final demand (That is customers with values 1 to 4 as Residual Bands for the year 2023/24 and 2024/25.
-- 5. Write SQL Codes calculate the annual import fixed charges for each customers of the three years.
-- 6. Write SQL code to extract the year 2023/24 customer name, 2023/24 residual bands, each year daily import fixed charge, and each year annual import fixed charge. The result should be extracted where 23/24 residual bands is equal to 24/25 residual bands, and the 2023/24 customer names is equal to 2024/25 customer names and 2022/23 customer names. 
-- 7. Create a temporary table (view) based on the query results in question 6.
-- 8. Write a SQL query to extract the residual bands and annual fixed charges from the view created in question 7 and then Aggregate the annual fixed charges based on bands for each year and order them based on bands.

-- THE BEGINING OF SCRIPT --

-- ** PLEASE RUN THE ENTIRE SCRIPT IN THIS FILE ** 
-- RUN THIS FILE BEFORE LESSONS 03 and 04--

-- ALL COMMANDS MUST END WITH A SEMICOLON (;)

-- CREATE DATABASE KC_SONGS_Database;
DROP DATABASE IF EXISTS SEPN_charges_db;
CREATE DATABASE IF NOT EXISTS SEPN_charges_db;

-- To start using the selected database
USE SEPN_charges_db;

-- CREATE TABLE FOR THIRD TABLE sepn_charges_2022_23_tb,
DROP TABLE IF EXISTS sepn_charges_2022_23_tb;
CREATE TABLE IF NOT EXISTS sepn_charges_2022_23_tb(
ID INT AUTO_INCREMENT PRIMARY KEY,
Name Varchar(10),
Import_Super_Red_charge DECIMAL(10,3),
Import_fixed_charge DECIMAL(10,2),
Export_Super_Red_charge DECIMAL(4,3),
Export_fixed_charge DOUBLE
);

-- CREATE TABLE FOR THIRD TABLE sepn_charges_2023_24_tb
DROP TABLE IF EXISTS sepn_charges_2023_24_tb;
CREATE TABLE IF NOT EXISTS sepn_charges_2023_24_tb(
ID INT AUTO_INCREMENT PRIMARY KEY,
Name Varchar(10),
Residual_Charging_Band TINYINT UNSIGNED,
Import_Super_Red_charge DECIMAL(10,3),
Import_fixed_charge DECIMAL(10,2),
Export_Super_Red_charge DECIMAL(4,3),
Export_fixed_charge DOUBLE
);

-- CREATE TABLE FOR THIRD TABLE sepn_charges_2024_25_tb
DROP TABLE IF EXISTS sepn_charges_2024_25_tb;
CREATE TABLE IF NOT EXISTS sepn_charges_2024_25_tb(
ID INT AUTO_INCREMENT PRIMARY KEY,
Name Varchar(10),
Residual_Charging_Band TINYINT UNSIGNED,
Import_Super_Red_charge DECIMAL(10,3),
Import_fixed_charge DECIMAL(10,2),
Export_Super_Red_charge DECIMAL(4,3),
Export_fixed_charge DOUBLE
);

SELECT *
FROM sepn_charges_2022_23_tb;


-- 1.1 Set the local_infile to 'ON' for faster loading
SET GLOBAL local_infile = 'ON';

-- 1.2 Use the SHOW command to see that it is effected
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE "secure_file_priv";

-- Loading the three Datasets into MySql Wokbench, one by one. 
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/input_files/sepn_charges_2022_23.csv"
INTO TABLE sepn_charges_2022_23_tb
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Name,Import_Super_Red_charge,Import_fixed_charge,Export_Super_Red_charge,Export_fixed_charge);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/input_files/sepn_charges_2023_24.csv"
INTO TABLE sepn_charges_2023_24_tb
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Name,Residual_Charging_Band,Import_Super_Red_charge,Import_fixed_charge,Export_Super_Red_charge,Export_fixed_charge);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/input_files/sepn_charges_2024_25.csv"
INTO TABLE sepn_charges_2024_25_tb
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Name,Residual_Charging_Band,Import_Super_Red_charge,Import_fixed_charge,Export_Super_Red_charge,Export_fixed_charge);


SHOW VARIABLES LIKE 'secure_file_priv';

-- To start Task 1, Write SQL codes to check the structures of each of the 3 tables
DESCRIBE sepn_charges_2022_23_tb;
DESCRIBE sepn_charges_2023_24_tb;
DESCRIBE sepn_charges_2024_25_tb;

-- Task2, Write SQL codes to display the number of records in each tables
SELECT COUNT(*)
FROM sepn_charges_2022_23_tb;

SELECT COUNT(*)
FROM sepn_charges_2023_24_tb;

SELECT COUNT(*)
FROM sepn_charges_2024_25_tb;

-- Task3, Write SQL codes to display the number of customers who are Non-final demand (That is customers with zero(0) values as Residual Bands for the year 2023/24 and 2024/25.
SELECT COUNT(*) AS Non_Final_Demand_Customers_23_24
FROM sepn_charges_2023_24_tb
WHERE Residual_Charging_Band = 0;

SELECT COUNT(*) AS Non_Final_Demand_Customers_24_25
FROM sepn_charges_2024_25_tb
WHERE Residual_Charging_Band = 0;

-- Task4, Write SQL codes to display the number of customers who are final demand (That is customers with values 1 to 4 as Residual Bands for the year 2023/24 and 2024/25.
SELECT COUNT(*) AS Final_Demand_Customers_23_24
FROM sepn_charges_2023_24_tb
WHERE Residual_Charging_Band IN (1,2,3,4);

SELECT COUNT(*) AS Final_Demand_Customers_24_25
FROM sepn_charges_2024_25_tb
WHERE Residual_Charging_Band IN (1,2,3,4);

-- Task5, Write SQL Codes calculate the annual import fixed charges for each customers of the three years.
-- SELECT Name, Import_fixed_charge, (Import_fixed_charge * 365) AS Annual_Import_Fixed_Charge
-- FROM sepn_charges_2022_23_tb;

-- SELECT Name, Import_fixed_charge, (Import_fixed_charge * 365) AS Annual_Import_Fixed_Charge
-- FROM sepn_charges_2023_24_tb;

-- SELECT Name, Import_fixed_charge, (Import_fixed_charge * 365) AS Annual_Import_Fixed_Charge
-- FROM sepn_charges_2024_25_tb;

-- Task6, Write SQL code to extract the year 2023/24 customer name, 2023/24 residual bands, each year daily import fixed charge, and each year annual import fixed charge. The result should be extracted where 23/24 residual bands is equal to 24/25 residual bands, and the 2023/24 customer names is equal to 2024/25 customer names and 2022/23 customer names. 
SELECT sepn_2023.Name AS sepn_23_cust_name,
sepn_2023.Residual_Charging_Band AS sepn_23_rcb,
sepn_2022.Import_fixed_charge AS sepn_22_ifc,
sepn_2023.Import_fixed_charge AS sepn_23_ifc,
sepn_2024.Import_fixed_charge AS sepn_24_ifc,
ROUND((sepn_2022.Import_fixed_charge/100),2)*365 AS sepn_22_afc,
ROUND((sepn_2023.Import_fixed_charge/100),2)*365 AS sepn_23_afc,
ROUND((sepn_2024.Import_fixed_charge/100),2)*365 AS sepn_24_afc
FROM
sepn_charges_2024_25_tb AS sepn_2024,
sepn_charges_2023_24_tb AS sepn_2023,
sepn_charges_2022_23_tb AS sepn_2022
WHERE
sepn_2023.Name = sepn_2022.Name
AND sepn_2023.Name = sepn_2024.Name
AND sepn_2023.Residual_Charging_Band = sepn_2024.Residual_Charging_Band;

-- Task7 Create a temporary table (view) based on the query results in question 6.
CREATE VIEW vw_customer_charge_summary AS
SELECT  sepn_2023.Name AS sepn_23_cust_name,
sepn_2023.Residual_Charging_Band AS sepn_23_rcb,
sepn_2022.Import_fixed_charge AS sepn_22_ifc,
sepn_2023.Import_fixed_charge AS sepn_23_ifc,
sepn_2024.Import_fixed_charge AS sepn_24_ifc,
ROUND((sepn_2022.Import_fixed_charge/100),2)*365 AS sepn_22_afc,
ROUND((sepn_2023.Import_fixed_charge/100),2)*365 AS sepn_23_afc,
ROUND((sepn_2024.Import_fixed_charge/100),2)*365 AS sepn_24_afc
FROM
sepn_charges_2024_25_tb AS sepn_2024,
sepn_charges_2023_24_tb AS sepn_2023,
sepn_charges_2022_23_tb AS sepn_2022
WHERE
sepn_2023.Name = sepn_2022.Name
AND sepn_2023.Name = sepn_2024.Name
AND sepn_2023.Residual_Charging_Band = sepn_2024.Residual_Charging_Band;


-- Task8 Write a SQL query to extract the residual bands and annual fixed charges from the view created in question 7 and then Aggregate the annual fixed charges based on bands for each year and order them based on bands.
SELECT DISTINCT(COALESCE(sepn_23_rcb,0)) AS RCB,
SUM(sepn_22_afc) AS total_sepn_22_afc,
SUM(sepn_23_afc) AS total_sepn_23_afc,
SUM(sepn_24_afc) AS total_sepn_24_afc
FROM vw_customer_charge_summary
GROUP BY RCB
HAVING RCB>0
ORDER BY RCB ASC;













 
