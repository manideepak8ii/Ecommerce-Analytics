-- ==========================================================
-- Query 61: Orders with Sales Above Average
-- ==========================================================

SELECT
    Order_ID,
    Sales
FROM superstore
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore
);

-- ==========================================================
-- Query 62: Products with Maximum Sales
-- ==========================================================

SELECT
    Product_Name,
    Sales
FROM superstore
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM superstore
);
-- ==========================================================
-- Query 63: Customers Whose Total Sales Exceed 10000
-- ==========================================================

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
HAVING SUM(Sales) > 10000;
-- ==========================================================
-- Query 64: Orders with Profit Greater Than Average Profit
-- ==========================================================

SELECT
    Order_ID,
    Profit
FROM superstore
WHERE Profit >
(
    SELECT AVG(Profit)
    FROM superstore
);
-- ==========================================================
-- Query 65: Sales by Category Using CTE
-- ==========================================================

WITH CategorySales AS
(
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Category
)

SELECT *
FROM CategorySales;
-- ==========================================================
-- Query 66: Top Category by Sales
-- ==========================================================

WITH CategorySales AS
(
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Category
)

SELECT *
FROM CategorySales
ORDER BY Total_Sales DESC
LIMIT 1;

-- ==========================================================
-- Query 67: Profit by Region Using CTE
-- ==========================================================

WITH RegionProfit AS
(
    SELECT
        Region,
        SUM(Profit) AS Total_Profit
    FROM superstore
    GROUP BY Region
)

SELECT *
FROM RegionProfit
ORDER BY Total_Profit DESC;
-- ==========================================================
-- Query 68: ROW_NUMBER()
-- ==========================================================

SELECT
    Customer_Name,
    Sales,
    ROW_NUMBER() OVER
    (
        ORDER BY Sales DESC
    ) AS Row_Num
FROM superstore;
-- ==========================================================
-- Query 69: RANK()
-- ==========================================================

SELECT
    Customer_Name,
    Sales,
    RANK() OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Rank
FROM superstore;
-- ==========================================================
-- Query 70: DENSE_RANK()
-- ==========================================================

SELECT
    Customer_Name,
    Sales,
    DENSE_RANK() OVER
    (
        ORDER BY Sales DESC
    ) AS Dense_Rank
FROM superstore;
-- ==========================================================
-- Query 71: Rank Products Within Each Category
-- ==========================================================

SELECT
    Category,
    Product_Name,
    Sales,
    RANK() OVER
    (
        PARTITION BY Category
        ORDER BY Sales DESC
    ) AS Category_Rank
FROM superstore;
-- ==========================================================
-- Query 72: Previous Sales Value
-- ==========================================================

SELECT
    Order_Date,
    Sales,
    LAG(Sales) OVER
    (
        ORDER BY Order_Date
    ) AS Previous_Sales
FROM superstore;
-- ==========================================================
-- Query 73: Next Sales Value
-- ==========================================================

SELECT
    Order_Date,
    Sales,
    LEAD(Sales) OVER
    (
        ORDER BY Order_Date
    ) AS Next_Sales
FROM superstore;
-- ==========================================================
-- Query 74: Running Sales Total
-- ==========================================================

SELECT
    Order_Date,
    Sales,
    SUM(Sales) OVER
    (
        ORDER BY Order_Date
    ) AS Running_Total
FROM superstore;
-- ==========================================================
-- Query 75: Moving Average of Sales
-- ==========================================================

SELECT
    Order_Date,
    Sales,
    AVG(Sales) OVER
    (
        ORDER BY Order_Date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Moving_Average
FROM superstore;

-- ==========================================================
-- Query 76: Classify Orders Based on Profit
-- ==========================================================

SELECT
    Order_ID,
    Profit,
    CASE
        WHEN Profit > 0 THEN 'Profit'
        WHEN Profit < 0 THEN 'Loss'
        ELSE 'Break Even'
    END AS Order_Status
FROM superstore;

-- ==========================================================
-- Query 77: Sales Category
-- ==========================================================

SELECT
    Order_ID,
    Sales,
    CASE
        WHEN Sales >= 1000 THEN 'High'
        WHEN Sales >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM superstore;

-- ==========================================================
-- Query 78: Count Orders by Status
-- ==========================================================

SELECT
    CASE
        WHEN Profit > 0 THEN 'Profit'
        WHEN Profit < 0 THEN 'Loss'
        ELSE 'Break Even'
    END AS Order_Status,
    COUNT(*) AS Total_Orders
FROM superstore
GROUP BY Order_Status;

-- ==========================================================
-- Query 79: Replace NULL Postal Codes
-- ==========================================================

SELECT
    Customer_Name,
    COALESCE(Postal_Code, 0) AS Postal_Code
FROM superstore;

-- ==========================================================
-- Query 80: Avoid Division by Zero
-- ==========================================================

SELECT
    Sales,
    Profit,
    Profit / NULLIF(Sales,0) AS Profit_Ratio
FROM superstore;

-- ==========================================================
-- Query 81: Customers Above Regional Average Sales
-- ==========================================================

SELECT
    Customer_Name,
    Region,
    Sales
FROM superstore s1
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore s2
    WHERE s1.Region = s2.Region
);

-- ==========================================================
-- Query 82: Create Sales Summary View
-- ==========================================================

CREATE VIEW Sales_Summary AS

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category;

-- ==========================================================
-- Query 83: Create Index on Customer Name
-- ==========================================================

CREATE INDEX idx_customer
ON superstore(Customer_Name);

DROP INDEX idx_customer ON superstore;

-- ==========================================================
-- Query 84: Highest Sale in Each Category
-- ==========================================================

SELECT
    Category,
    Product_Name,
    Sales,
    FIRST_VALUE(Sales)
    OVER
    (
        PARTITION BY Category
        ORDER BY Sales DESC
    ) AS Highest_Sale
FROM superstore;

-- ==========================================================
-- Query 85: Lowest Sale in Each Category
-- ==========================================================

SELECT
    Category,
    Product_Name,
    Sales,
    LAST_VALUE(Sales)
    OVER
    (
        PARTITION BY Category
        ORDER BY Sales
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Lowest_Sale
FROM superstore;

-- ==========================================================
-- Query 86: Divide Customers into Four Sales Groups
-- ==========================================================

SELECT
    Customer_Name,
    Sales,
    NTILE(4)
    OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Quartile
FROM superstore;

-- ==========================================================
-- Query 87: Top 3 Products by Sales in Each Category
-- ==========================================================

WITH RankedProducts AS
(
    SELECT
        Category,
        Product_Name,
        Sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Sales DESC
        ) AS rn
    FROM superstore
)

SELECT *
FROM RankedProducts
WHERE rn <= 3;