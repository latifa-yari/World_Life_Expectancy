#World Life Expectancy Project (Data Cleaning)

-- Step 1: Preview the raw data

SELECT * 
FROM world_life_expectancy
;

-- Step 2: Check for duplicate records by Country and Year

SELECT Country, Year, CONCAT (Country, Year), COUNT(CONCAT (Country, Year))
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT (Country, Year)
HAVING COUNT(CONCAT (Country, Year)) > 1
;

-- Step 3: Identify the Row_IDs of duplicate records to delete later ( We create the Row_ID on our own.

SELECT *
FROM (
	SELECT Row_ID,
	CONCAT (Country, Year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT (Country, Year) ORDER BY CONCAT (Country, Year)) as Row_Num
	FROM world_life_expectancy
	) AS Row_table
WHERE Row_Num > 1 
;

-- Step 4: Disable safe update mode to allow DELETE with subquery

SET SQL_SAFE_UPDATES = 0;

 -- Step 5: Delete the duplicate rows while keeping one copy of each Country-Year pair
 
DELETE FROM world_life_expectancy
WHERE 
	Row_ID IN (
	SELECT Row_ID
FROM (
	SELECT Row_ID,
	CONCAT (Country, Year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT (Country, Year) ORDER BY CONCAT (Country, Year)) as Row_Num
	FROM world_life_expectancy
	) AS Row_table
WHERE Row_Num > 1 
)
;

-- Step 6: Identify rows where the 'Status' column is blank (i.e., missing values)

SELECT *
FROM world_life_expectancy
WHERE Status = ''
; 

-- Step 7: View all the unique (non-blank) values in the 'Status' column

SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> ''
; 


-- Step 8: Find all countries that have at least one year labeled as 'Developing'
-- (We'll use this to fill in the missing years for those countries)

SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing'
;  

-- -- Step 9: Use a self-join to fill in missing 'Status' values for each country
-- Explanation:
-- This joins the table to itself on the 'Country' column.
-- For rows in t1 where 'Status' is blank, it looks for a matching row in t2
-- where 'Status' is not blank and is labeled as 'Developing'.
-- If such a match exists, it updates the blank status in t1 to 'Developing'.

UPDATE world_life_expectancy t1
JOIN  world_life_expectancy t2
	ON t1.Country = t2.Country 
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status != ''
AND t2.Status = 'Developing'
;

-- Step 10: Check again for missing values in the 'Status' column

SELECT *
FROM world_life_expectancy
WHERE Status = ''
; 

-- Step 11: Identify rows for the United States of America with missing 'Status'
-- Observation: USA still has blank 'Status' values because its correct label is 'Developed'

SELECT *
FROM world_life_expectancy
WHERE Country = 'United States of America'
;

-- Step 12: Use a self-join to update blank 'Status' values to 'Developed'
-- Explanation:
-- This joins the table to itself based on 'Country'.
-- It finds rows (t1) where 'Status' is blank and updates them to 'Developed'
-- if there exists another row (t2) for the same country where 'Status' is already 'Developed'.

UPDATE world_life_expectancy t1
JOIN  world_life_expectancy t2
	ON t1.Country = t2.Country 
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status != ''
AND t2.Status = 'Developed'
;

-- Step 13: Check for missing values in the 'Lifeexpectancy' column
-- Explanation:
-- Some rows may have blank strings ('') instead of proper numeric values.
-- This query identifies all rows where 'Lifeexpectancy' is blank or missing.

SELECT *
FROM world_life_expectancy
#WHERE `Lifeexpectancy` = ''
;

-- Step 14: Identify rows with missing 'Lifeexpectancy' values
-- Explanation:
-- This query selects records where 'Lifeexpectancy' is blank (i.e., missing).
-- These are the rows we plan to impute using data from adjacent years.

SELECT Country, Year, `Lifeexpectancy`
FROM world_life_expectancy
#WHERE `Lifeexpectancy` = '' -- Uncomment this when you want to filter only missing values
;

-- Step 15: Estimate missing 'Lifeexpectancy' values by using the average of the previous and next year
-- Explanation:
-- The first query below is used to preview how we plan to fill in missing life expectancy values.
-- It performs two self-joins:
--   - t2 represents the record for the **previous year** (Year - 1)
--   - t3 represents the record for the **next year** (Year + 1)
-- For each country-year where 'Lifeexpectancy' is blank (t1),
-- we compute the average of the values from t2 and t3 and round to 1 decimal place.

SELECT t1.Country, t1.Year, t1.`Lifeexpectancy`, 
t2.Country, t2.Year, t2.`Lifeexpectancy`,
t3.Country, t3.Year, t3.`Lifeexpectancy`,
ROUND((t2.`Lifeexpectancy` + t3.`Lifeexpectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
WHERE t1.`Lifeexpectancy` = ''
;


-- Step 16: Update the missing 'Lifeexpectancy' values in the original table
-- Explanation:
-- This UPDATE statement applies the imputed values directly to rows where 'Lifeexpectancy' is missing.
-- It uses the same self-join logic to average the values from the previous and next years
-- and updates the blank field accordingly.

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
SET t1.`Lifeexpectancy` = ROUND((t2.`Lifeexpectancy` + t3.`Lifeexpectancy`)/2,1)
WHERE t1.`Lifeexpectancy` = ''
;


