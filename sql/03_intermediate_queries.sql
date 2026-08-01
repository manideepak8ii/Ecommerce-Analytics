SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;


SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category;

SELECT
    Category,
    COUNT(*) AS Total_Orders
FROM superstore
GROUP BY Category;

SELECT
    Category,
    AVG(Sales) AS Average_Sales
FROM superstore
GROUP BY Category;

SELECT
    Category,
    MAX(Sales) AS Highest_Sale
FROM superstore
GROUP BY Category;

SELECT
    Category,
    MIN(Sales) AS Lowest_Sale
FROM superstore
GROUP BY Category;


SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region;

SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region;

SELECT
    State,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC;

SELECT
    State,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    State,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 500000;

SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
HAVING SUM(Profit) > 50000;

SELECT
    State,
    COUNT(*) AS Total_Orders
FROM superstore
GROUP BY State
HAVING COUNT(*) > 200;

SELECT
    Category,
    AVG(Sales) AS Avg_Sales
FROM superstore
GROUP BY Category
HAVING AVG(Sales) > 250;

SELECT
    `Order_Date`,
    YEAR(`Order_Date`) AS Order_Year
FROM superstore;

SELECT
    YEAR(`Order_Date`) AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY YEAR(`Order_Date`)
ORDER BY Order_Year;

SELECT
    YEAR(`Order_Date`) AS Order_Year,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY YEAR(`Order_Date`)
ORDER BY Order_Year;

SELECT
    MONTHNAME(`Order_Date`) AS Month_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY MONTH(`Order_Date`), MONTHNAME(`Order_Date`)
ORDER BY MONTH(`Order_Date`);

-- ==========================================================
-- Query 49: Sales by Month
-- ==========================================================

SELECT
    MONTHNAME(Order_Date) AS Month_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);


-- ==========================================================
-- Query 50: Profit by Quarter
-- ==========================================================

SELECT
    QUARTER(Order_Date) AS Quarter,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY QUARTER(Order_Date)
ORDER BY Quarter;


-- ==========================================================
-- Query 51: Shipping Days
-- ==========================================================

SELECT
    Order_ID,
    DATEDIFF(Ship_Date, Order_Date) AS Shipping_Days
FROM superstore;


-- ==========================================================
-- Query 52: Average Shipping Time
-- ==========================================================

SELECT
    AVG(DATEDIFF(Ship_Date, Order_Date)) AS Average_Shipping_Days
FROM superstore;


-- ==========================================================
-- Query 53: Average Shipping Time by Ship Mode
-- ==========================================================

SELECT
    Ship_Mode,
    AVG(DATEDIFF(Ship_Date, Order_Date)) AS Average_Days
FROM superstore
GROUP BY Ship_Mode
ORDER BY Average_Days;


-- ==========================================================
-- Query 54: Profit Margin (%)
-- ==========================================================

SELECT
    Order_ID,
    Sales,
    Profit,
    ROUND((Profit / Sales) * 100, 2) AS Profit_Margin
FROM superstore
WHERE Sales > 0;


-- ==========================================================
-- Query 55: Rounded Sales
-- ==========================================================

SELECT
    Sales,
    ROUND(Sales, 0) AS Rounded_Sales
FROM superstore;


-- ==========================================================
-- Query 56: Customer Names in Uppercase
-- ==========================================================

SELECT
    Customer_Name,
    UPPER(Customer_Name) AS Upper_Name
FROM superstore;


-- ==========================================================
-- Query 57: Customer Names in Lowercase
-- ==========================================================

SELECT
    Customer_Name,
    LOWER(Customer_Name) AS Lower_Name
FROM superstore;


-- ==========================================================
-- Query 58: Length of Product Name
-- ==========================================================

SELECT
    Product_Name,
    LENGTH(Product_Name) AS Name_Length
FROM superstore;


-- ==========================================================
-- Query 59: First 10 Characters of Product Name
-- ==========================================================

SELECT
    Product_Name,
    LEFT(Product_Name, 10) AS Short_Name
FROM superstore;


-- ==========================================================
-- Query 60: Customer and Region Combined
-- ==========================================================

SELECT
    CONCAT(Customer_Name, ' - ', Region) AS Customer_Region
FROM superstore;	