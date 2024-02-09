-- Q9. Create a stored procedure to display supplier id, name, rating and TYpe_of_supplier.  If rating >4 then "Genuine Supplier" if rating >2 "Average Supplier" else "Supplier should not be considered".

SELECT * FROM ecommerce.rating;

SELECT * FROM ecommerce.supplier;

-- Ientify the tables [order, supplier_pricing, supplier, rating]
select * from `order`;
select * from `supplier_pricing`;
select * from `supplier`;
select * from `rating`;

-- from result, we can see that the rating is provide with specific ORDER_ID of order table. so we can apply join
SELECT * FROM `order` as o
INNER JOIN
rating as rat
ON o.ORD_ID=rat.ORD_ID;

-- refine the result and only take relevant columns
SELECT o.PRICING_ID, rat.ORD_ID, rat.RAT_RATSTARS from `order` AS o
INNER JOIN
rating as rat
ON o.ORD_ID=rat.ORD_ID;

-- now we can join above result with supplier_pricing table
SELECT * FROM supplier_pricing as sp
INNER JOIN
(
	SELECT o.PRICING_ID, rat.ORD_ID, rat. RAT_RATSTARS FROM `order` as o
    INNER JOIN
    rating as rat on o.ORD_ID=rat.ORD_ID
) AS t1 on sp.PRICING_ID=t1.PRICING_ID;

-- only take the relevant columns
SELECT sp.SUPP_ID, t1.ORD_ID,t1.RAT_RATSTARS from supplier_pricing AS sp
INNER JOIN
(
	SELECT o.PRICING_ID, rat.ORD_ID, rat. RAT_RATSTARS FROM `order` AS o
    INNER JOIN
    rating as rat on o.ORD_ID=rat.ORD_ID
)AS t1 ON sp.PRICING_ID=t1.PRICING_ID;

-- sort by column SUPP_ID we can find various rating for each supplier. so find average.alter

SELECT test2.SUPP_ID, avg(RAT_RATSTARS) AS Average FROM
(
	SELECT sp.SUPP_ID, t1.ORD_ID,t1.RAT_RATSTARS from supplier_pricing AS sp
	INNER JOIN
	(
		SELECT o.PRICING_ID, rat.ORD_ID, rat. RAT_RATSTARS FROM `order` AS o
		INNER JOIN
		rating as rat on o.ORD_ID=rat.ORD_ID
	)AS t1 ON sp.PRICING_ID=t1.PRICING_ID
) AS test2 GROUP BY test2.SUPP_ID;

-- Apply case
SELECT report.SUPP_ID, report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    WHEN report.Average >4 THEN 'Good Service'
    WHEN report.Average >2 THEN 'Average Service'
    ELSE 'Poor Service'
END AS Type_of_Service FROM
    
(SELECT test2.SUPP_ID, avg(RAT_RATSTARS) AS Average FROM
	(
		SELECT sp.SUPP_ID, t1.ORD_ID,t1.RAT_RATSTARS FROM supplier_pricing AS sp
		INNER JOIN
		(
			SELECT o.PRICING_ID, rat.ORD_ID, rat. RAT_RATSTARS FROM `order` AS o
			INNER JOIN
			rating as rat on o.ORD_ID=rat.ORD_ID
		) AS t1 ON sp.PRICING_ID=t1.PRICING_ID
	)AS test2 GROUP BY test2.SUPP_ID) as report;

-- without Elimiter 
SELECT report.SUPP_ID, report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    WHEN report.Average >4 THEN 'Good Service'
    WHEN report.Average >2 THEN 'Average Service'
    ELSE 'Poor Service'
END AS Type_of_Service FROM
    
(SELECT test2.SUPP_ID, avg(RAT_RATSTARS) AS Average FROM
	(
		SELECT sp.SUPP_ID, t1.ORD_ID,t1.RAT_RATSTARS FROM supplier_pricing AS sp
		INNER JOIN
		(
			SELECT o.PRICING_ID, rat.ORD_ID, rat. RAT_RATSTARS FROM `order` AS o
			INNER JOIN
			rating as rat on o.ORD_ID=rat.ORD_ID
		) AS t1 ON sp.PRICING_ID=t1.PRICING_ID
	)AS test2 GROUP BY test2.SUPP_ID) as report;

-- With delimiter is give in the other file named 'Q9.with_Delimiter-supplier_rating.sql' in this folder.alter

   
   
