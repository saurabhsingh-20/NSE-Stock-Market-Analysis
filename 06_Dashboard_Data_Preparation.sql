/*=========================================================
PROJECT : NSE STOCK MARKET ANALYSIS

PHASE 7 : DASHBOARD DATA

Objective:
Prepare summary data for Excel Dashboard.

Author : Saurabh Singh
=========================================================*/


/*=========================================================
Query 1
Top 10 Companies by Average Closing Price
=========================================================*/

SELECT TOP 10
    [Company_Name],
    ROUND(AVG([Close]),2) AS Avg_Close
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Company_Name]
ORDER BY Avg_Close DESC;



/*=========================================================
Query 2
Top 10 Companies by Market Capitalization
=========================================================*/

SELECT TOP 10
    [Company_Name],
    MAX([Market_Cap]) AS Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Company_Name]
ORDER BY Market_Cap DESC;



/*=========================================================
Query 3
Top 10 Companies by Average Trading Volume
=========================================================*/

SELECT TOP 10
    [Company_Name],
    AVG(CAST([Volume] AS BIGINT)) AS Avg_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Company_Name]
ORDER BY Avg_Volume DESC;



/*=========================================================
Query 4
Sector Performance
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Close]),2) AS Avg_Close,
    AVG(CAST([Volume] AS BIGINT)) AS Avg_Volume,
    ROUND(AVG([PE_Ratio]),2) AS Avg_PE
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Sector]
ORDER BY Avg_Close DESC;



/*=========================================================
Query 5
Yearly Market Trend
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    ROUND(AVG([Close]),2) AS Avg_Close,
    SUM(CAST([Volume] AS BIGINT)) AS Total_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date])
ORDER BY Trading_Year;



/*=========================================================
Query 6
Monthly Market Trend
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    MONTH([Date]) AS Trading_Month,
    ROUND(AVG([Close]),2) AS Avg_Close,
    SUM(CAST([Volume] AS BIGINT)) AS Total_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY Trading_Year, Trading_Month;



/*=========================================================
Query 7
PE Ratio by Sector
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([PE_Ratio]),2) AS Avg_PE
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PE_Ratio] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_PE DESC;



/*=========================================================
Query 8
Market Cap by Sector
=========================================================*/

SELECT
    [Sector],
    MAX([Market_Cap]) AS Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Sector]
ORDER BY Market_Cap DESC;



/*=========================================================
Query 9
Average Daily Return by Sector
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Daily_Return]),4) AS Avg_Daily_Return
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Daily_Return] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_Daily_Return DESC;



/*=========================================================
Query 10
Volatility by Sector
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Volatility_20D]),4) AS Avg_Volatility
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Volatility_20D] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_Volatility DESC;