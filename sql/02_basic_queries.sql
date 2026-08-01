select *
from superstore where sales >500;

SELECT *
FROM superstore
WHERE Profit < 0;

SELECT *
FROM superstore
WHERE Category = 'Furniture';

SELECT *
FROM superstore
WHERE Category = 'Technology'
AND Sales > 1000;

SELECT *
FROM superstore
WHERE Category = 'Furniture'
OR Category = 'Office Supplies';



SELECT *
FROM superstore
WHERE Category IN ('Furniture', 'Technology');


SELECT *
FROM superstore
WHERE Sales BETWEEN 500 AND 1000;


SELECT *
FROM superstore
WHERE `Customer Name` LIKE 'A%';

SELECT *
FROM superstore
WHERE `Customer Name` LIKE '%n';

SELECT *
FROM superstore
WHERE `Customer Name` LIKE '%an%';


SELECT
    `Order ID`,
    Sales
FROM superstore
ORDER BY Sales;

SELECT
    `Order ID`,
    Sales
FROM superstore
ORDER BY Sales DESC;


SELECT
    `Order ID`,
    Sales
FROM superstore
ORDER BY Sales DESC
LIMIT 10;

SELECT
    `Order ID`,
    Profit
FROM superstore
ORDER BY Profit DESC
LIMIT 10;

SELECT
    `Order ID`,
    Profit
FROM superstore
ORDER BY Profit ASC
LIMIT 10;

SELECT
    `Product Name`,
    Quantity
FROM superstore
ORDER BY Quantity DESC
LIMIT 10;

SELECT
    Category,
    Sales
FROM superstore
ORDER BY Category,
         Sales DESC;
         
         
SELECT
    Region,
    Sales
FROM superstore
ORDER BY
    Region ASC,
    Sales DESC;
    
    
    SELECT
    `Customer Name`,
    Sales
FROM superstore
ORDER BY Sales DESC
LIMIT 20;


SELECT
    `Product Name`,
    Profit
FROM superstore
ORDER BY Profit DESC
LIMIT 20;