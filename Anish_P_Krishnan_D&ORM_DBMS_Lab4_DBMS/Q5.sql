-- Q5. Display the supplier details of who is supplying more than one product
use ecommerce;

-- identify the tables [supplier, supplier_pricing]
SELECT * FROM supplier as SUP;
SELECT * FROM supplier_pricing as SP;

SELECT COUNT(SP.PRO_ID) as No_Of_Product, SP.SUPP_ID from supplier_pricing as SP GROUP BY SP.SUPP_ID;
-- Select only those ids who have count more than 1
SELECT SP.SUPP_ID FROM supplier_pricing as SP GROUP By SP.SUPP_ID HAVING COUNT(SP.SUPP_ID)>1;

-- select supplier details from supplier only whose id is present in above query
SELECT SUP.* FROM supplier AS SUP 
WHERE SUP.SUPP_ID in
(
	SELECT SP.SUPP_ID FROM supplier_pricing as SP 
    GROUP By SP.SUPP_ID HAVING COUNT(SP.SUPP_ID)>1
);

-- another way of writing the query
SELECT supplier.* FROM supplier where supplier.SUPP_ID in
	(
		SELECT SUPP_ID FROM supplier_pricing GROUP BY SUPP_ID
		HAVING COUNT(SUPP_ID)>1
	)
		GROUP BY supplier.SUPP_ID;
		