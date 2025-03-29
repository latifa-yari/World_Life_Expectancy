
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

#### 1. Countries with Greatest Life Expectancy Improvement  
- Haiti showed the most improvement (~28.7 years) over 15 years.

#### 2. Global Trend Over Time  
- Global life expectancy rose from ~66.75 to ~71.24 between 2007–2020.

#### 3. GDP vs Life Expectancy  
- High-GDP countries live ~10 years longer on average compared to low-GDP countries.

#### 4. GDP Bracket Comparison  
- Countries with GDP ≥ 1500 have an average life expectancy of 74.2, while GDP ≤ 1500 is around 64.7.

#### 5. Developed vs Developing Countries  
- Developed countries average ~79.2 years in life expectancy, while developing countries average ~66.8 years.

#### 6. BMI and Life Expectancy  
- Higher BMI is positively correlated with longer life expectancy, possibly indicating better food access or quality healthcare.

#### 7. Adult Mortality Trend (Rolling)  
- Rolling sum of adult mortality by country shows long-term shifts in public health outcomes.

---

## 🧰 Tools Used
- MySQL Workbench
- SQL: Window Functions, Aggregates, Subqueries
- macOS screenshot tools for visuals

---

## ✅ Outcome
- The dataset is cleaned, structured, and ready for analysis.
- EDA uncovered valuable insights around life expectancy, GDP, BMI, and mortality.
---

## 👤 Author
**Latifa Yari** – Data Analyst  
