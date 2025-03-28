-- World Life Expectancy Project (Exploratory Data Analysis)

-- Step 1: Preview the full dataset

SELECT *
FROM world_life_expectancy
;

-- Step 2: Analyze life expectancy range per country
-- Goal: Find the countries with the largest increase in life expectancy over time.
-- - We use MIN() and MAX() to get the range per country
-- - Exclude rows where Lifeexpectancy is 0 (invalid/missing data)
-- - Calculate the net increase (MAX - MIN)
-- - Sort in descending order to highlight countries with the highest gains

SELECT Country, 
MIN(`Lifeexpectancy`), 
MAX(`Lifeexpectancy`),
ROUND(MAX(`Lifeexpectancy`) - MIN(`Lifeexpectancy`),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Lifeexpectancy`) <> 0
AND MAX(`Lifeexpectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC
;

-- Step 3: Analyze global trend of life expectancy over time
-- Goal: Track the global average life expectancy by year.
-- - Filter out rows where Lifeexpectancy is 0 (invalid)
-- - Calculate average Lifeexpectancy per year
-- - Round to 2 decimal places for readability
-- - Order by Year to visualize the trendSELECT Year, ROUND(AVG(`Lifeexpectancy`), 2)

SELECT Year, ROUND(AVG(`Lifeexpectancy`), 2)
FROM world_life_expectancy
WHERE `Lifeexpectancy` <> 0
AND `Lifeexpectancy` <> 0
GROUP BY Year 
ORDER BY Year
; 

SELECT *
FROM world_life_expectancy
;

-- Step 4: Examine the correlation between GDP and life expectancy
-- Goal: Assess how economic wealth (GDP) relates to life expectancy across countries.
-- - Calculate average GDP and life expectancy for each country
-- - Exclude rows with zero GDP or life expectancy to avoid invalid entries
-- - Order by GDP to visualize trends among lower- and higher-income countries
-- Insight: Countries with higher GDP often show longer life expectancy,
-- while lower GDP tends to correlate with shorter lifespans.

SELECT Country, ROUND(AVG(`Lifeexpectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP DESC
;


-- Step 5: Compare life expectancy between high-GDP and low-GDP countries
-- Goal: Analyze the difference in average life expectancy between countries 
-- with GDP above and below 1500.
-- - High GDP: GDP ≥ 1500
-- - Low GDP: GDP ≤ 1500
-- - Calculate the number of countries in each group
-- - Compute the average life expectancy for each group
-- Insight: On average, low-GDP countries have approximately 10 years lower life expectancy than high-GDP countries.

SELECT
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Lifeexpectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Lifeexpectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy
; 

SELECT * 
FROM world_life_expectancy
;

-- Step 6: Analyze average life expectancy by development status
-- Goal: Compare average life expectancy between 'Developing' and 'Developed' countries.
-- - Uses GROUP BY on the 'Status' column
-- - Rounds the average life expectancy to 1 decimal place

SELECT Status, ROUND(AVG(`Lifeexpectancy`), 1)
FROM world_life_expectancy
GROUP BY Status
;

-- Step 7: Compare average life expectancy by development status
-- Goal: Evaluate the number of countries and average life expectancy 
-- based on their 'Status' (Developed vs. Developing).
-- - COUNT(DISTINCT Country): Total number of unique countries in each group
-- - AVG(Lifeexpectancy): Mean life expectancy per group
-- Insight: Fewer developed countries are represented in the dataset, 
-- which may slightly skew the global average life expectancy upward.

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Lifeexpectancy`), 1)
FROM world_life_expectancy
GROUP BY Status
; 
-- Step 8: Investigate the relationship between BMI and life expectancy
-- Goal: Explore whether higher average BMI is associated with higher life expectancy.
-- - Calculate average Lifeexpectancy and BMI per country
-- - Filter out non-positive values to ensure data quality
-- Insight: Countries with higher BMI may also have better access to food and healthcare,
-- which can positively influence life expectancy.

SELECT Country, ROUND(AVG(`Lifeexpectancy`),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI 
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI DESC
;

-- Step 9: Explore adult mortality trends using a rolling total
-- Goal: Analyze cumulative adult mortality over time for specific countries.
-- - Use the SUM() window function to calculate a running total by country
-- - The result shows how mortality accumulates year over year
-- - Filter is applied to countries with 'United' in their name
-- Useful for identifying long-term mortality trends and patterns.

SELECT Country,
Year,
`Lifeexpectancy`,
`AdultMortality`,
SUM(`AdultMortality`)OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%'
; 

  
 







