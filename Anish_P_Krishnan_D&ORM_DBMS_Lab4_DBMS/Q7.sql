-- Q7. Display the Id and Name of the Product ordered after "2021-10-05".

use ecommerce;
SELECT *  FROM ecommerce.order;
-- identify the tables [order, supplier_pricing, product]
Select * from `order`;
select * from `supplier_pricing`;
select * from `product`;

-- start from order table
select * from `order`;

-- join order table with supplier_pricing
SELECT * FROM `ORDER` AS o
INNER JOIN
supplier_pricing AS sp ON sp.PRICING_ID=o.PRICING_ID;

-- take only those order which is ordered after "2021-10-05".
SELECT o.*, sp.PRO_ID FROM `ORDER` as o
INNER JOIN
supplier_pricing AS sp on sp.PRICING_ID=o.PRICING_ID and o.ORD_DATE>"2021-10-05";

-- take relevent column only
SELECT * FROM PRODUCT AS p
INNER JOIN
(
	SELECT o.*, sp.PRO_ID FROM `ORDER` as o
    INNER JOIN
    supplier_pricing AS sp ON sp.PRICING_ID=o.PRICING_ID and o.ORD_DATE>"2021-10-05"
) AS q
ON p.PRO_ID=q.PRO_ID;

-- to get expected result
SELECT p.PRO_ID, p.PRO_NAME FROM PRODUCT AS p
INNER JOIN
(
	SELECT o.*, sp.PRO_ID FROM `ORDER` as o
    INNER JOIN
    supplier_pricing AS sp ON sp.PRICING_ID=o.PRICING_ID and o.ORD_DATE>"2021-10-05"
) AS q
ON p.PRO_ID=q.PRO_ID;



