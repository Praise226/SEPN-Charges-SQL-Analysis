# SEPN Charges SQL Analysis

## Overview
Analysis of Scottish & Southern Electricity Networks (SEPN) import fixed charges 
across three financial years (2022/23, 2023/24, 2024/25) using MySQL.

## Objectives
- Segment customers into Final and Non-Final demand categories
- Calculate annual import fixed charges per customer across all three years
- Perform multi-year JOIN analysis to track customer charge progression
- Aggregate charges by residual band for year-on-year comparison

## Tasks Completed
1. Database and table creation with structured schema design
2. CSV data loading into MySQL using LOAD DATA INFILE
3. Table structure inspection using DESCRIBE
4. Record count queries per table
5. Non-Final demand customer count (Residual Band = 0)
6. Final demand customer count (Residual Band 1–4)
7. Annual import fixed charge calculation per customer
8. Multi-table JOIN across all three years
9. View creation for reusable query results
10. Aggregated band-level charge reporting with GROUP BY

## Tools Used
- MySQL 8.0
- MySQL Workbench

## Key Concepts Demonstrated
- DDL (CREATE, DROP, USE)
- DML (LOAD DATA INFILE)
- Aggregate functions (COUNT, SUM, ROUND)
- Multi-table JOINs
- Views
- GROUP BY, HAVING, ORDER BY
