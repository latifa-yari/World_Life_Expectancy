# World Life Expectancy – SQL Data Cleaning Project

## Overview
This project focuses on cleaning the World Life Expectancy dataset using SQL. The dataset contains inconsistencies, duplicate records, missing values, and poorly formatted fields. The goal was to clean and prepare the data for further analysis.

The project was completed following a step-by-step approach, and screenshots of the data before and after cleaning were captured to demonstrate the changes made.

---

## Cleaning Steps

### Step 1–2: Preview and Identify Duplicates
- Viewed the raw dataset.
- Identified duplicate records using `Country` and `Year` as the composite key.

### Step 3–5: Remove Duplicates
- Created a `Row_ID` column manually.
- Used `ROW_NUMBER()` with `PARTITION BY Country, Year` to isolate duplicate rows.
- Deleted all duplicate rows while retaining the first occurrence.

### Step 6–12: Handle Missing 'Status' Values
- Identified rows where the `Status` column was blank.
- Populated missing 'Status' as 'Developing' for countries that had any 'Developing' record.
- Specifically handled the United States of America where 'Developed' was the appropriate label.

### Step 13–16: Handle Missing 'Lifeexpectancy' Values
- Identified rows with blank 'Lifeexpectancy' values.
- Used a self-join to fetch the previous and next year for the same country.
- Imputed the missing value using the average of the previous and next year values.
- Updated the original table with the imputed values.

---

## Key SQL Concepts Used
- `ROW_NUMBER()` window function
- Self-Joins
- Aggregate Functions
- Subqueries
- Conditional Updates
- Data Imputation Techniques

---

## Files
- `World_Life_Expectancy Cleaning.sql` – Full SQL script with comments
- `Screenshots/` – Folder with images showing data before and after cleaning

---

## Outcome
The dataset was successfully cleaned:
- All duplicate records were removed.
- Blank 'Status' and 'Lifeexpectancy' fields were filled with accurate values.
- The dataset is now consistent and analysis-ready.

---

## Author
Latifa Yari – Data Analyst 
