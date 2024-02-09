CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_rating`()
BEGIN
	SELECT report.SUPP_ID, report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    WHEN report.Average >4 THEN 'Good Service'
    WHEN report.Average >2 THEN 'Average Service'
    ELSE 'Poor Service'
END AS Type_of_Service FROM
(
	SELECT test2.SUPP_ID, avg(RAT_RATSTARS) AS Average FROM
	(
		SELECT sp.SUPP_ID, t1.ORD_ID,t1.RAT_RATSTARS FROM supplier_pricing AS sp
		INNER JOIN
		(
			SELECT o.PRICING_ID, rat.ORD_ID, rat. RAT_RATSTARS FROM `order` AS o
			INNER JOIN
			rating as rat on o.ORD_ID=rat.ORD_ID
		) AS t1 ON sp.PRICING_ID=t1.PRICING_ID
	) AS test2 GROUP BY test2.SUPP_ID
) AS report;
END