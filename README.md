# NSE Stock Market Analysis using SQL Server

## Overview

This project explores historical NIFTY 50 stock market data using Microsoft SQL Server. The analysis focuses on understanding company performance, sector trends, market behaviour over time, and key financial metrics through SQL queries.

The project follows a structured workflow beginning with data validation and quality checks, followed by exploratory analysis, time-series analysis, advanced SQL techniques, and preparation of business-ready datasets.

---

## Dataset

- **Dataset:** NIFTY 50 Historical Stock Data
- **Time Period:** 1999–2026
- **Records:** 287,310+
- **Companies:** 49
- **Sectors:** 13

> **Note:** The original dataset has been divided into six CSV files to comply with GitHub's file size limits. Together, these files represent the complete dataset used in this analysis.
---

## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

---

## Project Structure

```
NSE-Stock-Market-Analysis
│
├── Dataset
│   └── nifty50_historical_data.csv
│
├── SQL
│   ├── 01_Data_Understanding_And_Quality_Check.sql
│   ├── 02_Sector_Analysis.sql
│   ├── 03_Time_Series_Analysis.sql
│   ├── 04_Advanced_SQL.sql
│   ├── 05_Dashboard_KPI_Queries.sql
│   └── 06_Dashboard_Data_Preparation.sql
│
└── README.md
```

---

## Project Workflow

The analysis was completed in six stages:

### 1. Data Understanding & Quality Check
- Explored the dataset structure
- Checked missing values
- Identified duplicate records
- Validated numerical data
- Verified date range and company information

### 2. Sector Analysis
- Compared sector performance
- Analyzed market capitalization
- Evaluated trading volume
- Compared valuation metrics
- Measured sector volatility

### 3. Time Series Analysis
- Yearly market trends
- Monthly market trends
- Closing price trends
- Trading volume trends
- Return analysis

### 4. Advanced SQL
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- LAG() and LEAD()
- Running totals
- Moving averages

### 5. KPI Queries
Business metrics generated for reporting, including:
- Total trading records
- Total companies
- Total sectors
- Average closing price
- Trading volume
- Market capitalization
- PE Ratio

### 6. Dashboard Data Preparation
Prepared summary tables that can be used for reporting and dashboard development.

---

## SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- ROW_NUMBER()
- LAG()
- LEAD()
- Date Functions

---

## Business Questions Answered

Some of the questions explored during this analysis include:

- Which companies have the highest average closing price?
- Which sectors have the highest market capitalization?
- How has trading volume changed over time?
- Which sectors generate the highest average returns?
- How do valuation metrics differ across sectors?
- Which companies consistently perform well over the study period?

---

## Future Improvements

The current project focuses on SQL-based analysis. Future improvements include:

- Building an interactive Excel dashboard
- Developing a Power BI dashboard
- Automating data refresh
- Adding predictive analysis using Python

---

## Author

**Saurabh Singh**

B.Sc. (Mathematics) with Computer Science Minor

Aspiring Data Analyst | SQL | Excel | Power BI | Python
