-- Q4. Display all th eorders along with product name ordered by a customer having Customer_id=2
use ecommerce;
-- identify the tables [order, supplier, product]
SELECT o.* FROM `order` AS o;
SELECT * FROM supplier_pricing;
SELECT * FROM product;

-- Apply join with Order table and supplier_pricing table
SELECT o.* FROM `ORDER` AS o
INNER JOIN supplier_pricing AS sp
WHERE o.PRICING_ID=SP.PRICING_ID;

-- Apply join with customer table
SELECT p.* FROM
(
	SELECT o.*,sp.PRO_ID FROM `ORDER` AS o
    INNER JOIN supplier_pricing AS sp
    WHERE o.PRICING_ID=sp.PRICING_ID
) AS p
INNER JOIN CUSTOMER as c
WHERE p.CUS_ID=c.CUS_ID;

-- Take Relavent column only
SELECT c.CUS_ID,c.CUS_NAME, p.ORD_ID, p.ORD_AMOUNT FROM
(
	SELECT o.*, sp.PRO_ID  FROM `ORDER` AS o
    INNER JOIN supplier_pricing AS sp
    WHERE o.PRICING_ID=sp.PRICING_ID
)AS p
INNER JOIN CUSTOMER as c
WHERE p.CUS_ID=c.CUS_ID and c.CUS_ID=2;
-- final query
SELECT q.CUS_ID, q.CUS_NAME,q.ORD_ID, product.PRO_NAME FROM
(
	SELECT c.CUS_ID,c.CUS_NAME, p.ORD_ID, p.ORD_AMOUNT, p.PRO_ID FROM
	(
		SELECT o.*, sp.PRO_ID  FROM `ORDER` AS o
		INNER JOIN supplier_pricing AS sp
		WHERE o.PRICING_ID=sp.PRICING_ID
	)AS p
	INNER JOIN CUSTOMER as c
	WHERE p.CUS_ID=c.CUS_ID and c.CUS_ID=2

)as q
INNER JOIN product
on q.PRO_ID =product.PRO_ID;


-- or we can also do the same with this query as well
use ecommerce;
SELECT product.PRO_NAME, `order`.* FROM `order`, supplier_pricing, product
WHERE `order` .CUS_ID =2 and
`order` .PRICING_ID=supplier_pricing.PRICING_ID and supplier_pricing.PRO_ID=product.PRO_ID;
