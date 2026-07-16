/*=========================================================
    PROJECT : NSE STOCK MARKET ANALYSIS
    PHASE 3 : SECTOR ANALYSIS

    Objective:
    Compare different sectors of the Indian stock market
    using financial and trading metrics.
=========================================================*/


/*=========================================================
    Query 1
    Business Question:
    Which sectors have the highest average closing price?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Close]),2) AS Avg_Close_Price
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Sector]
ORDER BY Avg_Close_Price DESC;



/*=========================================================
    Query 2
    Business Question:
    Which sectors have the highest average trading volume?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG(CAST([Volume] AS BIGINT)),0) AS Avg_Trading_Volume
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Sector]
ORDER BY Avg_Trading_Volume DESC;



/*=========================================================
    Query 3
    Business Question:
    Which sectors have the highest average market cap?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG(CAST([Market_Cap] AS FLOAT)),2) AS Avg_Market_Cap
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Sector]
ORDER BY Avg_Market_Cap DESC;



/*=========================================================
    Query 4
    Business Question:
    Which sectors have the highest average PE Ratio?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([PE_Ratio]),2) AS Avg_PE_Ratio
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PE_Ratio] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_PE_Ratio DESC;



/*=========================================================
    Query 5
    Business Question:
    Which sectors have the highest average PEG Ratio?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([PEG_Ratio]),2) AS Avg_PEG_Ratio
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [PEG_Ratio] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_PEG_Ratio DESC;



/*=========================================================
    Query 6
    Business Question:
    Which sectors have the highest average daily return?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Daily_Return]),4) AS Avg_Daily_Return
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Daily_Return] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_Daily_Return DESC;



/*=========================================================
    Query 7
    Business Question:
    Which sectors pay the highest average dividend?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Dividend]),2) AS Avg_Dividend
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY [Sector]
ORDER BY Avg_Dividend DESC;



/*=========================================================
    Query 8
    Business Question:
    Which sectors have the highest average dividend yield?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Dividend_Yield]),2) AS Avg_Dividend_Yield
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Dividend_Yield] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_Dividend_Yield DESC;



/*=========================================================
    Query 9
    Business Question:
    Which sectors are the most volatile?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Volatility_20D]),4) AS Avg_Volatility
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Volatility_20D] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_Volatility DESC;



/*=========================================================
    Query 10
    Business Question:
    Which sectors have the highest average Beta?
=========================================================*/

SELECT
    [Sector],
    ROUND(AVG([Beta]),2) AS Avg_Beta
FROM [NIFTY].[dbo].[nifty50_historical_data]
WHERE [Beta] IS NOT NULL
GROUP BY [Sector]
ORDER BY Avg_Beta DESC;