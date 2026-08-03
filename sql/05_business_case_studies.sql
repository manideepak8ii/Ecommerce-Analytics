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

-- ============================================================================
-- BUSINESS CASE STUDY 16
-- Top 10 Products by Revenue
-- ============================================================================

/*
Business Question:
------------------
Which products generate the highest revenue?

Business Value:
---------------
• Identify the best-selling products.
• Keep these products well stocked.
• Use them in promotions and advertisements.
*/

SELECT

    -- Product Name
    Product_Name,

    -- Calculate total revenue generated by each product
    SUM(Sales) AS Total_Sales

FROM superstore

-- Combine rows belonging to the same product
GROUP BY Product_Name

-- Display products with highest revenue first
ORDER BY Total_Sales DESC

-- Show only Top 10 products
LIMIT 10;



-- ============================================================================
-- BUSINESS CASE STUDY 17
-- Bottom 10 Products by Profit
-- ============================================================================

/*
Business Question:
------------------
Which products generate the least profit?

Business Value:
---------------
• Identify products causing losses.
• Review pricing strategy.
• Reduce discounts if required.
*/

SELECT

    Product_Name,

    -- Total profit earned by every product
    SUM(Profit) AS Total_Profit

FROM superstore

GROUP BY Product_Name

-- Lowest profit first
ORDER BY Total_Profit ASC

LIMIT 10;



-- ============================================================================
-- BUSINESS CASE STUDY 18
-- Top 5 Cities by Revenue
-- ============================================================================

/*
Business Question:
------------------
Which cities contribute the highest sales?

Business Value:
---------------
• Expand operations in these cities.
• Increase marketing budget.
*/

SELECT

    City,

    SUM(Sales) AS Total_Sales

FROM superstore

GROUP BY City

ORDER BY Total_Sales DESC

LIMIT 5;



-- ============================================================================
-- BUSINESS CASE STUDY 19
-- Top 5 Cities by Profit
-- ============================================================================

/*
Business Question:
------------------
Which cities are the most profitable?

Business Value:
---------------
Revenue alone isn't enough.
Profit tells us which cities actually make money.
*/

SELECT

    City,

    SUM(Profit) AS Total_Profit

FROM superstore

GROUP BY City

ORDER BY Total_Profit DESC

LIMIT 5;



-- ============================================================================
-- BUSINESS CASE STUDY 20
-- Revenue by Customer Segment
-- ============================================================================

/*
Business Question:
------------------
Which customer segment contributes the most revenue?

Business Value:
---------------
• Consumer
• Corporate
• Home Office

Find the segment generating maximum business.
*/

SELECT

    Segment,

    SUM(Sales) AS Revenue,

    SUM(Profit) AS Profit

FROM superstore

GROUP BY Segment

ORDER BY Revenue DESC;



-- ============================================================================
-- BUSINESS CASE STUDY 21
-- Average Discount by Category
-- ============================================================================

/*
Business Question:
------------------
Which category receives the highest average discount?

Business Value:
---------------
Higher discounts may reduce profitability.
*/

SELECT

    Category,

    ROUND(AVG(Discount),2) AS Avg_Discount

FROM superstore

GROUP BY Category;



-- ============================================================================
-- BUSINESS CASE STUDY 22
-- Orders with Highest Discount
-- ============================================================================

/*
Business Question:
------------------
Which orders received the highest discounts?

Business Value:
---------------
Check whether high discounts are increasing sales
or simply reducing profit.
*/

SELECT

    Order_ID,

    Product_Name,

    Discount,

    Sales,

    Profit

FROM superstore

ORDER BY Discount DESC

LIMIT 10;



-- ============================================================================
-- BUSINESS CASE STUDY 23
-- Revenue by Shipping Mode
-- ============================================================================

/*
Business Question:
------------------
Which shipping mode generates the highest revenue?

Business Value:
---------------
Compare Standard, Second Class,
First Class and Same Day deliveries.
*/

SELECT

    Ship_Mode,

    SUM(Sales) AS Revenue,

    SUM(Profit) AS Profit

FROM superstore

GROUP BY Ship_Mode

ORDER BY Revenue DESC;



-- ============================================================================
-- BUSINESS CASE STUDY 24
-- Most Frequently Ordered Products
-- ============================================================================

/*
Business Question:
------------------
Which products are ordered most often?

Business Value:
---------------
These products require higher inventory.
*/

SELECT

    Product_Name,

    COUNT(*) AS Times_Ordered

FROM superstore

GROUP BY Product_Name

ORDER BY Times_Ordered DESC

LIMIT 10;



-- ============================================================================
-- BUSINESS CASE STUDY 25
-- Customers with Maximum Orders
-- ============================================================================

/*
Business Question:
------------------
Which customers place the most orders?

Business Value:
---------------
Frequent customers deserve loyalty benefits.
*/

SELECT

    Customer_Name,

    COUNT(*) AS Total_Orders

FROM superstore

GROUP BY Customer_Name

ORDER BY Total_Orders DESC

LIMIT 10;



-- ============================================================================
-- BUSINESS CASE STUDY 26
-- Regional Revenue Contribution
-- ============================================================================

/*
Business Question:
------------------
What percentage of total revenue comes from each region?

Business Value:
---------------
Understand contribution of each region
towards company revenue.
*/

SELECT

    Region,

    SUM(Sales) AS Revenue,

    ROUND(

        SUM(Sales) * 100 /

        (SELECT SUM(Sales)
         FROM superstore),

    2) AS Revenue_Percentage

FROM superstore

GROUP BY Region

ORDER BY Revenue DESC;



-- ============================================================================
-- BUSINESS CASE STUDY 27
-- Profit Margin by Category
-- ============================================================================

/*
Business Question:
------------------
Which category has the highest profit margin?

Formula:
--------
Profit Margin = Profit / Sales × 100
*/

SELECT

    Category,

    ROUND(

        SUM(Profit) /

        SUM(Sales) * 100,

        2

    ) AS Profit_Margin

FROM superstore

GROUP BY Category

ORDER BY Profit_Margin DESC;



-- ============================================================================
-- BUSINESS CASE STUDY 28
-- Best Month by Sales
-- ============================================================================

/*
Business Question:
------------------
Which month generates maximum revenue?

Business Value:
---------------
Useful for seasonal planning.
*/

SELECT

    MONTHNAME(Order_Date) AS Month,

    SUM(Sales) AS Revenue

FROM superstore

GROUP BY

    MONTH(Order_Date),

    MONTHNAME(Order_Date)

ORDER BY Revenue DESC

LIMIT 1;



-- ============================================================================
-- BUSINESS CASE STUDY 29
-- Best Year by Profit
-- ============================================================================

/*
Business Question:
------------------
Which year generated maximum profit?
*/

SELECT

    YEAR(Order_Date) AS Year,

    SUM(Profit) AS Total_Profit

FROM superstore

GROUP BY YEAR(Order_Date)

ORDER BY Total_Profit DESC

LIMIT 1;



-- ============================================================================
-- BUSINESS CASE STUDY 30
-- Executive Dashboard KPIs
-- ============================================================================

/*
Business Question:
------------------
Display overall company performance.

These KPIs are commonly shown on executive dashboards.
*/

SELECT

    -- Total Orders
    COUNT(*) AS Total_Orders,

    -- Total Unique Customers
    COUNT(DISTINCT Customer_ID) AS Total_Customers,

    -- Overall Revenue
    SUM(Sales) AS Total_Revenue,

    -- Overall Profit
    SUM(Profit) AS Total_Profit,

    -- Average Order Value
    AVG(Sales) AS Average_Order_Value,

    -- Highest Order Value
    MAX(Sales) AS Highest_Order,

    -- Lowest Order Value
    MIN(Sales) AS Lowest_Order

FROM superstore;

-- ============================================================================
-- BUSINESS CASE STUDY 31
-- Pareto Analysis (80/20 Rule)
-- ============================================================================

/*
Business Question:
------------------
Which products contribute the most revenue?

Business Value:
---------------
• Identify the products that drive most revenue.
• Prioritize inventory and marketing.
*/

WITH ProductRevenue AS
(
    SELECT
        Product_Name,
        SUM(Sales) AS Revenue
    FROM superstore
    GROUP BY Product_Name
)

SELECT *

FROM ProductRevenue

ORDER BY Revenue DESC;

-- ============================================================================
-- BUSINESS CASE STUDY 31
-- Pareto Analysis (80/20 Rule)
-- ============================================================================

/*
Business Question:
------------------
Which products contribute the most revenue?

Business Value:
---------------
• Identify the products that drive most revenue.
• Prioritize inventory and marketing.
*/

WITH ProductRevenue AS
(
    SELECT
        Product_Name,
        SUM(Sales) AS Revenue
    FROM superstore
    GROUP BY Product_Name
)

SELECT *

FROM ProductRevenue

ORDER BY Revenue DESC;

-- ============================================================================
-- BUSINESS CASE STUDY 33
-- Month-over-Month Growth
-- ============================================================================

/*
Business Question:
------------------
How are monthly sales changing?
*/

WITH MonthlySales AS
(
    SELECT

        YEAR(Order_Date) AS Order_Year,

        MONTH(Order_Date) AS Order_Month,

        SUM(Sales) AS Revenue

    FROM superstore

    GROUP BY

        YEAR(Order_Date),

        MONTH(Order_Date)
)

SELECT

    Order_Year,

    Order_Month,

    Revenue,

    LAG(Revenue)
    OVER
    (
        ORDER BY Order_Year, Order_Month
    ) AS Previous_Month

FROM MonthlySales;

-- ============================================================================
-- BUSINESS CASE STUDY 34
-- Customer Segmentation
-- ============================================================================

/*
Business Question:
------------------
Divide customers into Gold, Silver and Bronze.
*/

SELECT

    Customer_Name,

    SUM(Sales) AS Total_Sales,

    CASE

        WHEN SUM(Sales) >= 20000 THEN 'Gold'

        WHEN SUM(Sales) >= 10000 THEN 'Silver'

        ELSE 'Bronze'

    END AS Customer_Type

FROM superstore

GROUP BY Customer_Name

ORDER BY Total_Sales DESC;

-- ============================================================================
-- BUSINESS CASE STUDY 35
-- Customer Lifetime Value
-- ============================================================================

/*
Business Question:
------------------
Which customers generated the highest lifetime sales?
*/

SELECT

    Customer_ID,

    Customer_Name,

    COUNT(*) AS Orders,

    SUM(Sales) AS Revenue,

    SUM(Profit) AS Profit

FROM superstore

GROUP BY

    Customer_ID,

    Customer_Name

ORDER BY Revenue DESC

LIMIT 20;

-- ============================================================================
-- BUSINESS CASE STUDY 36
-- Worst Performing States
-- ============================================================================

SELECT

    State,

    SUM(Sales) AS Revenue,

    SUM(Profit) AS Profit

FROM superstore

GROUP BY State

ORDER BY Profit ASC

LIMIT 10;

-- ============================================================================
-- BUSINESS CASE STUDY 37
-- Loss Making Orders
-- ============================================================================

SELECT

    Order_ID,

    Customer_Name,

    Product_Name,

    Sales,

    Profit

FROM superstore

WHERE Profit < 0

ORDER BY Profit;

-- ============================================================================
-- BUSINESS CASE STUDY 38
-- Highest Selling Product in Each Category
-- ============================================================================

WITH RankedProducts AS
(

SELECT

Category,

Product_Name,

SUM(Sales) AS Revenue,

ROW_NUMBER()

OVER

(

PARTITION BY Category

ORDER BY SUM(Sales) DESC

) rn

FROM superstore

GROUP BY

Category,

Product_Name

)

SELECT *

FROM RankedProducts

WHERE rn = 1;

-- ============================================================================
-- BUSINESS CASE STUDY 39
-- Best Region Every Year
-- ============================================================================

WITH RegionSales AS
(

SELECT

YEAR(Order_Date) AS Order_Year,

Region,

SUM(Sales) Revenue

FROM superstore

GROUP BY

YEAR(Order_Date),

Region

)

SELECT *

FROM RegionSales

ORDER BY

Order_Year,

Revenue DESC;

-- ============================================================================
-- BUSINESS CASE STUDY 40
-- Dashboard Dataset
-- ============================================================================

/*
This query produces KPIs that can be directly displayed
on a Power BI dashboard.
*/

SELECT

COUNT(*) AS Total_Orders,

COUNT(DISTINCT Customer_ID) AS Customers,

SUM(Sales) AS Revenue,

SUM(Profit) AS Profit,

ROUND(AVG(Sales),2) AS Average_Order_Value,

ROUND(AVG(Discount),2) AS Average_Discount,

SUM(Quantity) AS Quantity_Sold

FROM superstore;
