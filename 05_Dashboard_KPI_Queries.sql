/*=========================================================
PROJECT : NSE STOCK MARKET ANALYSIS

PHASE 6 : DASHBOARD KPI QUERIES

Objective:
Create Key Performance Indicators (KPIs)
for the Excel Dashboard.

Author : Saurabh Singh
=========================================================*/


/*=========================================================
KPI 1
Business Question:
How many trading records are in the dataset?
=========================================================*/

SELECT
COUNT(*) AS Total_Trading_Records
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 2
Business Question:
How many companies are analyzed?
=========================================================*/

SELECT
COUNT(DISTINCT [Ticker]) AS Total_Companies
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 3
Business Question:
How many sectors are included?
=========================================================*/

SELECT
COUNT(DISTINCT [Sector]) AS Total_Sectors
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 4
Business Question:
What is the total trading volume?
=========================================================*/

SELECT
SUM(CAST([Volume] AS BIGINT)) AS Total_Trading_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 5
Business Question:
What is the average closing price?
=========================================================*/

SELECT
ROUND(AVG([Close]),2) AS Average_Closing_Price
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 6
Business Question:
What is the highest closing price?
=========================================================*/

SELECT
MAX([Close]) AS Highest_Closing_Price
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 7
Business Question:
What is the lowest closing price?
=========================================================*/

SELECT
MIN([Close]) AS Lowest_Closing_Price
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 8
Business Question:
Average Daily Return
=========================================================*/

SELECT
ROUND(AVG([Daily_Return]),4) AS Average_Daily_Return
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Daily_Return] IS NOT NULL;



/*=========================================================
KPI 9
Business Question:
Average Market Capitalization
=========================================================*/

SELECT
ROUND(AVG(CAST([Market_Cap] AS FLOAT)),2) AS Average_Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 10
Business Question:
Highest Market Capitalization
=========================================================*/

SELECT
MAX([Market_Cap]) AS Highest_Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 11
Business Question:
Average PE Ratio
=========================================================*/

SELECT
ROUND(AVG([PE_Ratio]),2) AS Average_PE_Ratio
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PE_Ratio] IS NOT NULL;



/*=========================================================
KPI 12
Business Question:
Average PEG Ratio
=========================================================*/

SELECT
ROUND(AVG([PEG_Ratio]),2) AS Average_PEG_Ratio
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PEG_Ratio] IS NOT NULL;



/*=========================================================
KPI 13
Business Question:
Average Dividend Yield
=========================================================*/

SELECT
ROUND(AVG([Dividend_Yield]),2) AS Average_Dividend_Yield
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Dividend_Yield] IS NOT NULL;



/*=========================================================
KPI 14
Business Question:
Highest Stock Price Ever Recorded
=========================================================*/

SELECT
MAX([High]) AS Highest_Stock_Price
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
KPI 15
Business Question:
Lowest Stock Price Ever Recorded
=========================================================*/

SELECT
MIN([Low]) AS Lowest_Stock_Price
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
END OF KPI ANALYSIS
=========================================================*/