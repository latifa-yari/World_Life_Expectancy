# World Life Expectancy - SQL Exploratory Data Analysis

This project performs Exploratory Data Analysis (EDA) using SQL on the World Life Expectancy dataset. It uncovers trends, correlations, and disparities across countries over time using MySQL.

---

## Dataset
**Table Name**: `world_life_expectancy`  
**Source**: Provided dataset with key columns including:
- `Country`
- `Year`
- `Lifeexpectancy`
- `GDP`
- `Status` (Developed/Developing)
- `BMI`
- `AdultMortality`

---

## Objectives
- Explore trends in life expectancy over the years.
- Compare life expectancy between developed and developing countries.
- Investigate correlations between GDP, BMI, adult mortality, and life expectancy.
- Track top and bottom performers in terms of improvements over 15 years.

---

## Key SQL Insights

### 1. Dataset Overview  
📷 **[1_View_All_Records.png](./screenshots/1_View_All_Records.png)**  
```sql
SELECT * FROM world_life_expectancy;
```

---

### 2. Countries with Greatest Improvement in Life Expectancy  
📷 **[2_Countries_Improved_Life_Expectancy.png](./screenshots/2_Countries_Improved_Life_Expectancy.png)**  
- Haiti had the largest jump (28.7 years) over 15 years.  
```sql
SELECT Country, MIN(Lifeexpectancy), MAX(Lifeexpectancy), ROUND(MAX(...) - MIN(...), 1) AS Life_Increase_15_Years ...
```

---

### 3. Global Life Expectancy Trend  
📷 **[3_Global_Avg_Life_Expectancy_By_Year.png](./screenshots/3_Global_Avg_Life_Expectancy_By_Year.png)**  
- The global life expectancy improved steadily from ~66.75 to ~71.24 between 2007–2020.

---

### 4. GDP vs Life Expectancy  
📷 **[4_GDP_vs_Life_Expectancy_High.png](./screenshots/4_GDP_vs_Life_Expectancy_High.png)**  
📷 **[5_GDP_vs_Life_Expectancy_Low.png](./screenshots/5_GDP_vs_Life_Expectancy_Low.png)**  
- High GDP countries had ~10 years longer life expectancy compared to low GDP countries.  
```sql
SELECT Country, AVG(Lifeexpectancy), AVG(GDP) ...
```

---

### 5. GDP Brackets Comparison  
📷 **[6_GDP_Brackets_Comparison.png](./screenshots/6_GDP_Brackets_Comparison.png)**  
- Countries with GDP ≥ 1500: 74.2 years  
- Countries with GDP ≤ 1500: 64.7 years  

---

### 6. Developed vs Developing  
📷 **[7_Developed_vs_Developing_Count_LifeExp.png](./screenshots/7_Developed_vs_Developing_Count_LifeExp.png)**  
📷 **[8_Developed_vs_Developing_Avg_LifeExp.png](./screenshots/8_Developed_vs_Developing_Avg_LifeExp.png)**  
- Developed countries average ~79.2 years  
- Developing countries average ~66.8 years  

---

### 7. BMI and Life Expectancy  
📷 **[9_BMI_vs_Life_Expectancy_Low.png](./screenshots/9_BMI_vs_Life_Expectancy_Low.png)**  
📷 **[10_BMI_vs_Life_Expectancy_High.png](./screenshots/10_BMI_vs_Life_Expectancy_High.png)**  
- Higher BMI countries tend to have longer life expectancy.

---

### 8. Adult Mortality Trend (Rolling Sum)  
📷 **[11_Rolling_Adult_Mortality_Afghanistan.png](./screenshots/11_Rolling_Adult_Mortality_Afghanistan.png)**  
📷 **[12_Rolling_Adult_Mortality_USA.png](./screenshots/12_Rolling_Adult_Mortality_USA.png)**  
- The rolling sum provides insight into adult mortality trends per country over time.

---

## 🧰 Tools Used
- MySQL Workbench
- SQL Window Functions, Aggregates, Group By, Case-When
- Screenshot annotations via macOS

---

## 📌 Conclusion
This SQL EDA project highlights the critical influence of economic and health factors on life expectancy worldwide. With structured queries and visual outputs, it serves as a foundational analysis pipeline for health and development research.

---

## 📸 Screenshots Folder Structure
All screenshots are named by their corresponding analysis step for clarity.

## Author
Latif Yari – Aspiring Data Analyst  
[LinkedIn](#) | [GitHub](#)