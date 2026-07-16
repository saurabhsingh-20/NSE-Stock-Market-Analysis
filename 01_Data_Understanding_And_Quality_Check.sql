SELECT TOP (1000) [Date]
      ,[Ticker]
      ,[Company_Name]
      ,[Sector]
      ,[Open]
      ,[High]
      ,[Low]
      ,[Close]
      ,[Volume]
      ,[Dividend]
      ,[Stock_Split]
      ,[Daily_Return]
      ,[Volatility_20D]
      ,[MA_50]
      ,[MA_200]
      ,[Market_Cap]
      ,[PE_Ratio]
      ,[Forward_PE]
      ,[PEG_Ratio]
      ,[Price_to_Book]
      ,[Dividend_Yield]
      ,[EPS]
      ,[Beta]
      ,[_52Week_High]
      ,[_52Week_Low]
  FROM [NIFTY].[dbo].[nifty50_historical_data]

  SELECT COUNT(*) AS Total_Rows
FROM [NIFTY].[dbo].[nifty50_historical_data];

SELECT
    SUM(CASE WHEN [Open] IS NULL THEN 1 ELSE 0 END) AS Open_Nulls,
    SUM(CASE WHEN [High] IS NULL THEN 1 ELSE 0 END) AS High_Nulls,
    SUM(CASE WHEN [Low] IS NULL THEN 1 ELSE 0 END) AS Low_Nulls,
    SUM(CASE WHEN [Close] IS NULL THEN 1 ELSE 0 END) AS Close_Nulls,
    SUM(CASE WHEN [Daily_Return] IS NULL THEN 1 ELSE 0 END) AS DailyReturn_Nulls,
    SUM(CASE WHEN [EPS] IS NULL THEN 1 ELSE 0 END) AS EPS_Nulls
FROM [NIFTY].[dbo].[nifty50_historical_data];

--date range 
SELECT
    MIN([Date]) AS Start_Date,
    MAX([Date]) AS End_Date
FROM [NIFTY].[dbo].[nifty50_historical_data];

--Total Companies

SELECT COUNT(DISTINCT Ticker) AS Total_Companies
FROM [NIFTY].[dbo].[nifty50_historical_data];

--Total sector

SELECT COUNT(DISTINCT Sector) AS Total_Sectors
FROM [NIFTY].[dbo].[nifty50_historical_data];

-- List sector

SELECT DISTINCT Sector
FROM [NIFTY].[dbo].[nifty50_historical_data]
ORDER BY Sector;

--Duplicate Records
SELECT
    [Date],
    Ticker,
    COUNT(*) AS Duplicate_Count
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Date], Ticker
HAVING COUNT(*) > 1;

--Negative Price 

SELECT *
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE
    [Open] < 0
    OR [High] < 0
    OR [Low] < 0
    OR [Close] < 0;

    --invalid price logic
    SELECT *
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE
    [High] < [Open]
    OR [High] < [Close]
    OR [Low] > [Open]
    OR [Low] > [Close];

    -- negative trading value

    SELECT *
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Volume] < 0;

/*========================================================
 PHASE 2 : COMPANY ANALYSIS
========================================================*/


-----------------------------------------------------------
-- Query 1
-- Business Question:
-- Which companies have the highest average closing price?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([Close]),2) AS Avg_Close_Price
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Avg_Close_Price DESC;

-----------------------------------------------------------
-- Query 2
-- Business Question:
-- Which companies have the highest average trading volume?
-----------------------------------------------------------
SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG(CAST([Volume] AS BIGINT)),0) AS Avg_Trading_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Avg_Trading_Volume DESC;



-----------------------------------------------------------
-- Query 3
-- Business Question:
-- Which companies have the highest market capitalization?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    MAX([Market_Cap]) AS Highest_Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Highest_Market_Cap DESC;



-----------------------------------------------------------
-- Query 4
-- Business Question:
-- Which companies have the highest average PE Ratio?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([PE_Ratio]),2) AS Average_PE_Ratio
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PE_Ratio] IS NOT NULL
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Average_PE_Ratio DESC;



-----------------------------------------------------------
-- Query 5
-- Business Question:
-- Which companies have the lowest average PE Ratio?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([PE_Ratio]),2) AS Average_PE_Ratio
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PE_Ratio] IS NOT NULL
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Average_PE_Ratio ASC;



-----------------------------------------------------------
-- Query 6
-- Business Question:
-- Which companies have the highest average daily return?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([Daily_Return]),4) AS Avg_Daily_Return
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Daily_Return] IS NOT NULL
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Avg_Daily_Return DESC;



-----------------------------------------------------------
-- Query 7
-- Business Question:
-- Which companies have the highest average stock price?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG(([Open]+[High]+[Low]+[Close])/4.0),2) AS Avg_Stock_Price
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Avg_Stock_Price DESC;



-----------------------------------------------------------
-- Query 8
-- Business Question:
-- Which companies pay the highest average dividend?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([Dividend]),2) AS Avg_Dividend
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Avg_Dividend DESC;



-----------------------------------------------------------
-- Query 9
-- Business Question:
-- Which companies have the highest Beta?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([Beta]),2) AS Average_Beta
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Beta] IS NOT NULL
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Average_Beta DESC;



-----------------------------------------------------------
-- Query 10
-- Business Question:
-- Which companies have the highest Dividend Yield?
-----------------------------------------------------------

SELECT
    [Ticker],
    [Company_Name],
    ROUND(AVG([Dividend_Yield]),2) AS Average_Dividend_Yield
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Dividend_Yield] IS NOT NULL
GROUP BY
    [Ticker],
    [Company_Name]
ORDER BY Average_Dividend_Yield DESC;

