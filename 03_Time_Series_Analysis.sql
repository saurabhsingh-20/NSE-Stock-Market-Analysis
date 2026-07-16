/*=========================================================
    PROJECT : NSE STOCK MARKET ANALYSIS
    PHASE 4 : TIME SERIES ANALYSIS

    Objective:
    Analyze how the Indian stock market has changed
    over time using yearly and monthly trends.
=========================================================*/


/*=========================================================
    Query 1
    Business Question:
    How many trading records are available each year?
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    COUNT(*) AS Total_Records
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date])
ORDER BY Trading_Year;



/*=========================================================
    Query 2
    Business Question:
    What is the average closing price every year?
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    ROUND(AVG([Close]),2) AS Average_Close
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date])
ORDER BY Trading_Year;



/*=========================================================
    Query 3
    Business Question:
    Which year had the highest trading volume?
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    SUM(CAST([Volume] AS BIGINT)) AS Total_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date])
ORDER BY Total_Volume DESC;



/*=========================================================
    Query 4
    Business Question:
    Which year had the highest average daily return?
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    ROUND(AVG([Daily_Return]),4) AS Avg_Daily_Return
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Daily_Return] IS NOT NULL
GROUP BY YEAR([Date])
ORDER BY Avg_Daily_Return DESC;



/*=========================================================
    Query 5
    Business Question:
    Average market capitalization by year
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    ROUND(AVG(CAST([Market_Cap] AS FLOAT)),2) AS Avg_Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date])
ORDER BY Trading_Year;



/*=========================================================
    Query 6
    Business Question:
    Average PE Ratio by year
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    ROUND(AVG([PE_Ratio]),2) AS Avg_PE
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PE_Ratio] IS NOT NULL
GROUP BY YEAR([Date])
ORDER BY Trading_Year;



/*=========================================================
    Query 7
    Business Question:
    Monthly average closing price
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    MONTH([Date]) AS Trading_Month,
    ROUND(AVG([Close]),2) AS Average_Close
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    Trading_Year,
    Trading_Month;



/*=========================================================
    Query 8
    Business Question:
    Monthly trading volume
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    MONTH([Date]) AS Trading_Month,
    SUM(CAST([Volume] AS BIGINT)) AS Total_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    Trading_Year,
    Trading_Month;



/*=========================================================
    Query 9
    Business Question:
    Monthly average daily return
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    MONTH([Date]) AS Trading_Month,
    ROUND(AVG([Daily_Return]),4) AS Avg_Daily_Return
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Daily_Return] IS NOT NULL
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    Trading_Year,
    Trading_Month;



/*=========================================================
    Query 10
    Business Question:
    Highest closing price recorded each year
=========================================================*/

SELECT
    YEAR([Date]) AS Trading_Year,
    MAX([Close]) AS Highest_Close
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY YEAR([Date])
ORDER BY Trading_Year;