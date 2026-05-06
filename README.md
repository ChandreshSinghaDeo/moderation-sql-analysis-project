# 📊 Moderation Data Analysis (SQL Project)

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Project](https://img.shields.io/badge/Project-Data%20Analysis-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 🚀 Project Summary

An end-to-end SQL project analyzing moderation logs, focusing on data ingestion, cleaning, transformation, and advanced analytical insights using real-world datasets.

This project simulates how data analysts work with raw operational data to generate meaningful business insights.

---

## 🎯 Objectives

* Clean and structure raw moderation data
* Analyze violation patterns and moderation activity
* Identify high-risk boards and spam sources
* Evaluate moderator performance
* Generate insights for business decision-making

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

  * Date formats (string → DATE/DATETIME)
  * Boolean values (Y/N → 1/0)

---

## 🧠 SQL Skills Demonstrated

* Data Cleaning: `TRIM`, `NULLIF`, `CASE WHEN`
* Date Handling: `STR_TO_DATE`, `DATE_FORMAT`
* Aggregations: `COUNT`, `SUM`, `AVG`
* Window Functions: `RANK`, `DENSE_RANK`, `ROW_NUMBER`, `LAG`, `LEAD`
* Common Table Expressions (CTEs)
* Conditional Aggregation
* Subqueries & Derived Tables
* Indexing for performance

---

## 📊 Key Analysis Performed

### 🔹 Violation Analysis

* Identified top violation categories
* Calculated percentage distribution of violations

### 🔹 Trend Analysis

* Daily and monthly moderation trends
* Running totals and workload growth

### 🔹 Moderator Performance

* Ranked moderators using window functions
* Identified above-average performers

### 🔹 Board Risk Analysis

* Identified boards with highest violations
* Analyzed sub-board level issues

### 🔹 Spam Detection

* Detected repeat spam IPs and emails
* Identified duplicate user activity

---

## 📊 Key Insights

* Spam-related violations contribute significantly to moderation workload
* Certain boards consistently generate higher violations (high-risk areas)
* A small group of moderators handle the majority of actions
* Moderation activity shows clear weekly and monthly trends
* Repeated spam IPs indicate potential automated abuse

---

## 📁 Project Structure

```
moderation-sql-analysis-project/
│
├── README.md
├── sql/
│   ├── 01_schema_and_load.sql
│   ├── 02_data_validation.sql
│   ├── 03_exploratory_analysis.sql
│   ├── 04_advanced_queries.sql
│
├── data/ (optional)
├── screenshots/ (optional)
```

---

## ⚙️ How to Run This Project

1. Clone this repository
2. Open MySQL Workbench
3. Run the SQL files in the following order:

```
sql/01_schema_and_load.sql
sql/02_data_validation.sql
sql/03_exploratory_analysis.sql
sql/04_advanced_queries.sql
```

4. Ensure `local_infile` is enabled for data loading

---

## 💼 Business Impact

* Enables data-driven moderation decisions
* Helps identify high-risk communities and spam patterns
* Improves moderator performance evaluation
* Supports workload planning and resource allocation

---

## 🚀 Future Enhancements

* Build Power BI dashboard for visualization
* Automate pipeline using Python
* Implement real-time monitoring system

---

## 👤 Author

**Chandresh Singhadeo**
