/*=========================================================
    PROJECT : NSE STOCK MARKET ANALYSIS
    PHASE 5 : ADVANCED SQL

    Objective:
    Use advanced SQL techniques to answer complex
    financial business questions.
=========================================================*/


/*=========================================================
Query 1
Business Question:
Rank companies by average closing price.
Concept:
RANK()
=========================================================*/

WITH CompanyAvg AS
(
    SELECT
        [Ticker],
        [Company_Name],
        ROUND(AVG([Close]),2) AS Avg_Close
    FROM [NIFTY].[dbo].[nifty50_historical_data]
    GROUP BY [Ticker],[Company_Name]
)

SELECT *,
RANK() OVER(ORDER BY Avg_Close DESC) AS Company_Rank
FROM CompanyAvg;



/*=========================================================
Query 2
Business Question:
Rank companies inside each sector.
Concept:
PARTITION BY + RANK()
=========================================================*/

WITH CompanySector AS
(
SELECT
    [Sector],
    [Ticker],
    [Company_Name],
    AVG([Close]) AS Avg_Close
FROM [NIFTY].[dbo].[nifty50_historical_data]
GROUP BY
    [Sector],
    [Ticker],
    [Company_Name]
)

SELECT *,
RANK() OVER(PARTITION BY Sector ORDER BY Avg_Close DESC) AS Sector_Rank
FROM CompanySector;



/*=========================================================
Query 3
Business Question:
Show previous day's closing price.
Concept:
LAG()
=========================================================*/

SELECT
    [Ticker],
    [Date],
    [Close],
    LAG([Close]) OVER
    (
        PARTITION BY [Ticker]
        ORDER BY [Date]
    ) AS Previous_Close
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
Query 4
Business Question:
Show next day's closing price.
Concept:
LEAD()
=========================================================*/

SELECT
    [Ticker],
    [Date],
    [Close],
    LEAD([Close]) OVER
    (
        PARTITION BY [Ticker]
        ORDER BY [Date]
    ) AS Next_Close
FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
Query 5
Business Question:
Running trading volume.
Concept:
Running Total
=========================================================*/

SELECT
    [Ticker],
    [Date],
    [Volume],

SUM(CAST([Volume] AS BIGINT))
OVER
(
PARTITION BY [Ticker]
ORDER BY [Date]
ROWS UNBOUNDED PRECEDING
) AS Running_Volume

FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
Query 6
Business Question:
Moving average of closing price.
Concept:
Window Frame
=========================================================*/

SELECT
    [Ticker],
    [Date],
    [Close],

AVG([Close])
OVER
(
PARTITION BY [Ticker]
ORDER BY [Date]
ROWS BETWEEN 19 PRECEDING AND CURRENT ROW
) AS Moving_Average_20

FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
Query 7
Business Question:
Top 3 companies in each sector.
Concept:
ROW_NUMBER()
=========================================================*/

WITH RankedCompanies AS
(
SELECT
    [Sector],
    [Ticker],
    [Company_Name],
    AVG([Close]) AS Avg_Close,

ROW_NUMBER() OVER
(
PARTITION BY Sector
ORDER BY AVG([Close]) DESC
) AS RN

FROM [NIFTY].[dbo].[nifty50_historical_data]

GROUP BY
    [Sector],
    [Ticker],
    [Company_Name]
)

SELECT *
FROM RankedCompanies
WHERE RN<=3;



/*=========================================================
Query 8
Business Question:
Highest closing price of each company.
Concept:
MAX() OVER()
=========================================================*/

SELECT
    [Ticker],
    [Date],
    [Close],

MAX([Close])
OVER(PARTITION BY [Ticker]) AS Highest_Close

FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
Query 9
Business Question:
Lowest closing price of each company.
=========================================================*/

SELECT
    [Ticker],
    [Date],
    [Close],

MIN([Close])
OVER(PARTITION BY [Ticker]) AS Lowest_Close

FROM [NIFTY].[dbo].[nifty50_historical_data];



/*=========================================================
Query 10
Business Question:
Difference between today's and yesterday's price.
=========================================================*/

WITH PriceChange AS
(
SELECT
    [Ticker],
    [Date],
    [Close],

LAG([Close])
OVER
(
PARTITION BY [Ticker]
ORDER BY [Date]
) Previous_Close

FROM [NIFTY].[dbo].[nifty50_historical_data]
)

SELECT *,
ROUND(([Close]-Previous_Close),2) AS Price_Change
FROM PriceChange;