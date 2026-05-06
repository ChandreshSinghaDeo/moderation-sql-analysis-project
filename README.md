# 📊 Moderation Data Analysis (SQL Project)

## 🚀 Project Overview

This project demonstrates an end-to-end SQL-based data analysis pipeline on moderation log data. It includes data ingestion, cleaning, transformation, and advanced analytics using SQL.

---

## 🎯 Objectives

* Clean and structure raw moderation data
* Analyze violation patterns and moderation activity
* Identify high-risk boards and spam sources
* Evaluate moderator performance
* Build insights for decision-making

---

## 🛠️ Tools & Technologies

* MySQL
* SQL (Window Functions, CTEs, Aggregations)
* GitHub (Version Control)

---

## 🔄 ETL Process

* Loaded CSV data using `LOAD DATA LOCAL INFILE`
* Cleaned data using:

  * `TRIM()`
  * `NULLIF()`
  * `STR_TO_DATE()`
  * `CASE WHEN`
* Converted:

  * Date formats
  * Boolean values (Y/N → 1/0)

---

## 📊 Key Analysis Performed

### 🔹 Violation Analysis

* Top violation categories
* Percentage distribution of violations

### 🔹 Trend Analysis

* Daily and monthly moderation trends
* Running totals and workload growth

### 🔹 Moderator Performance

* Ranking moderators using `RANK()`
* Identifying above-average performers

### 🔹 Board Risk Analysis

* Boards with highest violations
* Sub-board level insights

### 🔹 Spam Detection

* Repeat spam IPs and emails
* Duplicate user activity detection

---

## ⚡ Advanced SQL Concepts Used

* Window Functions (`RANK`, `LAG`, `LEAD`, `ROW_NUMBER`)
* Common Table Expressions (CTEs)
* Conditional Aggregation (`CASE WHEN`)
* Subqueries and Derived Tables

---

## 📁 Project Structure

```
sql/
├── 01_schema_and_load.sql
├── 02_data_validation.sql
├── 03_exploratory_analysis.sql
├── 04_advanced_queries.sql
```

---

## 📌 Key Insights

* Certain boards consistently generate higher violations
* Spam-related violations dominate moderation workload
* A small group of moderators handle majority of actions
* Moderation workload shows periodic spikes

---

## 💼 Business Impact

* Helps prioritize moderation resources
* Identifies high-risk areas for intervention
* Improves spam detection strategy
* Supports data-driven moderation decisions

---

## 🚀 Future Enhancements

* Power BI dashboard integration
* Automated data pipeline using Python
* Real-time moderation monitoring

---

## 👤 Author

Chandresh Singhadeo
