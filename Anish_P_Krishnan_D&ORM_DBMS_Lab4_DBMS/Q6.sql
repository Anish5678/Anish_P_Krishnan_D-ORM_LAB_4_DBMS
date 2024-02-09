-- Q6. Find the least expensive product from each category and print the table with category id, name, and price of the product

use ecommerce;

-- Identify the tables [supplier_pricing, product, category]
SELECT * FROM product;
SELECT * FROM supplier_pricing;
SELECT * FROM category;

-- Start with supplier_pricing
SELECT * FROM supplier_pricing;
-- Sort the records on PRO_ID, we can observe that each product have prices by different suppliers. alter
-- So we have to identify that product which have min price.alter
SELECT PRO_ID, min(SUPP_PRICE) as Min_Price FROM supplier_pricing GROUP BY PRO_ID;

-- Now join above result with product table
SELECT * FROM product AS p
INNER JOIN
(
	SELECT PRO_ID, MIN(SUPP_PRICE) as Min_Price FROM supplier_pricing group by PRO_ID
) AS t2 ON t2.PRO_ID=p.PRO_ID;

-- Refine the result and take only necessary columns
SELECT p.CAT_ID, p.PRO_NAME, t2.* FROM product as p
INNER JOIN
(
	SELECT PRO_ID, MIN(SUPP_PRICE) as Min_Price FROM supplier_pricing group by PRO_ID
)AS t2 ON t2.PRO_ID=p.PRO_ID;

-- Join the above result with category
SELECT * FROM category as cat
INNER JOIN
(
	SELECT p.CAT_ID, P.PRO_NAME, t2. * FROM product as p
    INNER JOIN
    (
		SELECT PRO_ID, MIN(SUPP_PRICE) as Min_Price FROM supplier_pricing group by PRO_ID
	) AS t2 ON t2.PRO_ID=p.PRO_ID
) AS t3 ON t3.CAT_ID=cat.CAT_ID;

-- Refine the result
SELECT c.CAT_ID, c.CAT_NAME, MIN(t3.min_price) AS Min_Price FROM category as c
INNER JOIN
(
	SELECT p.CAT_ID, p.PRO_NAME, t2.* FROM product AS p
    INNER JOIN
    (
		SELECT PRO_ID, MIN(SUPP_PRICE) AS Min_Price FROM supplier_pricing GROUP BY PRO_ID
	) AS t2 WHERE t2.PRO_ID=p.PRO_ID
) AS t3 WHERE t3.CAT_ID=c.CAT_ID GROUP BY t3.CAT_ID;


-- 
