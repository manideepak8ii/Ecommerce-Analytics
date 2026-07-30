CREATE DATABASE ecommerce_analytics;
use ecommerce_analytics;
select database();
show tables;
SELECT COUNT(*) FROM superstore;
SELECT *
FROM superstore
limit 10;



SHOW COLUMNS FROM superstore;

ALTER TABLE superstore RENAME COLUMN `Row ID` TO Row_ID;

ALTER TABLE superstore RENAME COLUMN `Order ID` TO Order_ID;

ALTER TABLE superstore RENAME COLUMN `Order Date` TO Order_Date;

ALTER TABLE superstore RENAME COLUMN `Ship Date` TO Ship_Date;

ALTER TABLE superstore RENAME COLUMN `Ship Mode` TO Ship_Mode;

ALTER TABLE superstore RENAME COLUMN `Customer ID` TO Customer_ID;

ALTER TABLE superstore RENAME COLUMN `Customer Name` TO Customer_Name;

ALTER TABLE superstore RENAME COLUMN `Postal Code` TO Postal_Code;

ALTER TABLE superstore RENAME COLUMN `Product ID` TO Product_ID;

ALTER TABLE superstore RENAME COLUMN `Sub-Category` TO Sub_Category;

ALTER TABLE superstore RENAME COLUMN `Product Name` TO Product_Name;

SELECT
    Order_ID,
    Customer_Name,
    Sales,
    Profit
FROM superstore limit 10

