-- ==========================================================
-- Case Study 1: Executive KPI Dashboard
-- ==========================================================

SELECT
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Sales) AS Average_Order_Value,
    SUM(Quantity) AS Total_Quantity
FROM superstore;

-- ==========================================================
-- Case Study 2: Top 10 Customers
-- ==========================================================

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================================
-- Case Study 3
-- ==========================================================

SELECT
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================================
-- Case Study 4
-- ==========================================================

SELECT
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Customer_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- ==========================================================
-- Case Study 5
-- ==========================================================

SELECT
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================================
-- Case Study 6
-- ==========================================================

SELECT
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit
LIMIT 10;

-- ==========================================================
-- Case Study 7
-- ==========================================================

SELECT
    Category,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit
FROM superstore
GROUP BY Category
ORDER BY Sales DESC;

-- ==========================================================
-- Case Study 8
-- ==========================================================

SELECT
    Sub_Category,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Profit DESC;

-- ==========================================================
-- Case Study 9
-- ==========================================================

SELECT
    Region,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit
FROM superstore
GROUP BY Region
ORDER BY Profit DESC;

-- ==========================================================
-- Case Study 10
-- ==========================================================

SELECT
    State,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit
FROM superstore
GROUP BY State
ORDER BY Profit DESC;

-- ==========================================================
-- Case Study 11
-- ==========================================================

SELECT
    YEAR(Order_Date) AS Year,
    MONTHNAME(Order_Date) AS Month,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date),
    MONTHNAME(Order_Date)
ORDER BY
    Year,
    MONTH(Order_Date);

-- ==========================================================
-- Case Study 12
-- ==========================================================

SELECT
    YEAR(Order_Date) AS Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY YEAR(Order_Date)
ORDER BY Year;

-- ==========================================================
-- Case Study 13
-- ==========================================================

SELECT
    Ship_Mode,
    AVG(DATEDIFF(Ship_Date, Order_Date)) AS Avg_Delivery_Days
FROM superstore
GROUP BY Ship_Mode
ORDER BY Avg_Delivery_Days;

-- ==========================================================
-- Case Study 14
-- ==========================================================

SELECT
    Discount,
    AVG(Profit) AS Average_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- ==========================================================
-- Case Study 15
-- ==========================================================

WITH RankedProducts AS
(
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS rn
    FROM superstore
    GROUP BY Category, Product_Name
)

SELECT *
FROM RankedProducts
WHERE rn <= 5;
