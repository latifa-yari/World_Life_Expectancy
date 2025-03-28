
# World Life Expectancy – SQL Data Cleaning & Exploratory Data Analysis (EDA)

## 🧾 Overview
This project combines **data cleaning** and **exploratory data analysis (EDA)** on the **World Life Expectancy** dataset using SQL and MySQL Workbench. The dataset originally contained inconsistencies, duplicate records, missing values, and formatting issues. After cleaning, EDA was performed to uncover trends, disparities, and relationships across countries and over time.

---

## 🧹 Part 1: Data Cleaning

### 📌 Objective
Prepare a clean, consistent dataset by addressing:
- Duplicate records
- Inconsistent formatting
- Missing values (e.g., `Status`, `Lifeexpectancy`)

### 🧪 Cleaning Steps

#### Step 1–2: Preview and Identify Duplicates
- Viewed the raw dataset.
- Identified duplicate records using `Country` and `Year` as the composite key.

#### Step 3–5: Remove Duplicates
- Created a `Row_ID` column manually.
- Used `ROW_NUMBER()` with `PARTITION BY Country, Year` to isolate duplicates.
- Deleted all duplicate rows while retaining the first occurrence.

#### Step 6–12: Handle Missing 'Status' Values
- Populated missing `Status` values based on patterns in the country.
- Handled special cases like the United States with accurate assignment.

#### Step 13–16: Handle Missing 'Lifeexpectancy' Values
- Used self-joins to retrieve previous and next year values.
- Imputed missing values with the average of those values.

---

## 🛠️ Key SQL Concepts Used in Cleaning
- `ROW_NUMBER()` window function
- Self-Joins
- Conditional `UPDATE`
- Data Imputation
- Subqueries & filtering

---

## 📊 Part 2: Exploratory Data Analysis (EDA)

### 🔍 Objectives
- Identify trends in life expectancy over time.
- Compare developed vs developing countries.
- Understand how GDP, BMI, and adult mortality affect life expectancy.
- Highlight top and bottom performing countries.

### 📈 Key EDA Insights

#### 1. Dataset Overview  
📷 

#### 2. Countries with Greatest Life Expectancy Improvement  
📷 **[2_Countries_Improved_Life_Expectancy.png](./Exploratory%20Data%20Analysis/Screenshots/02_Countries_Improved_Life_Expectancy.png)**  
- Haiti showed the most improvement (~28.7 years) over 15 years.

#### 3. Global Trend Over Time  
📷 **[3_Global_Avg_Life_Expectancy_By_Year.png](./Exploratory%20Data%20Analysis/Screenshots/03_Global_Avg_Life_Expectancy_By_Year.png)**  
- Global life expectancy rose from ~66.75 to ~71.24 between 2007–2020.

#### 4. GDP vs Life Expectancy  
📷 **[4_GDP_vs_Life_Expectancy_High.png](./Exploratory%20Data%20Analysis/Screenshots/04_GDP_vs_Life_Expectancy_High.png)**  
📷 **[5_GDP_vs_Life_Expectancy_Low.png](./Exploratory%20Data%20Analysis/Screenshots/05_GDP_vs_Life_Expectancy_Low.png)**  
- High-GDP countries live ~10 years longer on average.

#### 5. GDP Bracket Comparison  
📷 **[6_GDP_Brackets_Comparison.png](./Exploratory%20Data%20Analysis/Screenshots/6_GDP_Brackets_Comparison.png)**  
- GDP ≥ 1500: Avg life expectancy = 74.2  
- GDP ≤ 1500: Avg life expectancy = 64.7  

#### 6. Developed vs Developing Countries  
📷 **[7_Developed_vs_Developing_Count_LifeExp.png](./Exploratory%20Data%20Analysis/Screenshots/7_Developed_vs_Developing_Count_LifeExp.png)**  
📷 **[8_Developed_vs_Developing_Avg_LifeExp.png](./Exploratory%20Data%20Analysis/Screenshots/8_Developed_vs_Developing_Avg_LifeExp.png)**  
- Developed: ~79.2 years  
- Developing: ~66.8 years  

#### 7. BMI and Life Expectancy  
📷 **[9_BMI_vs_Life_Expectancy_Low.png](./Exploratory%20Data%20Analysis/Screenshots/9_BMI_vs_Life_Expectancy_Low.png)**  
📷 **[10_BMI_vs_Life_Expectancy_High.png](./Exploratory%20Data%20Analysis/Screenshots/10_BMI_vs_Life_Expectancy_High.png)**  
- Higher BMI → higher life expectancy correlation.

#### 8. Adult Mortality Trend (Rolling)  
📷 **[11_Rolling_Adult_Mortality_Afghanistan.png](./Exploratory%20Data%20Analysis/Screenshots/11_Rolling_Adult_Mortality_Afghanistan.png)**  
📷 **[12_Rolling_Adult_Mortality_USA.png](./Exploratory%20Data%20Analysis/Screenshots/12_Rolling_Adult_Mortality_USA.png)**  

---

## 🧰 Tools Used
- MySQL Workbench
- SQL: Window Functions, Aggregates, Subqueries
- macOS screenshot tools for visuals

---

## ✅ Outcome
- The dataset is cleaned, structured, and ready for analysis.
- EDA uncovered valuable insights around life expectancy, GDP, BMI, and mortality.
- 
---

## 👤 Author
**Latifa Yari** – Data Analyst  
