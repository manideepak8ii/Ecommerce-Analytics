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