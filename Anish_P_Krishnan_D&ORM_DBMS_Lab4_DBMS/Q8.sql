-- Q8. Display customer name and gender whose names start or end with character 'A'

use ecommerce;

-- identify the table [customer]
SELECT * FROM ecommerce.customer;

-- select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME LIKE 'A%'
select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME LIKE 'A%';

-- select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME LIKE '%A'
select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME LIKE '%A';

-- to get expected result - Display customer name and gender whose names start or end with character 'A'
select customer.CUS_NAME, customer.CUS_GENDER from customer where customer.CUS_NAME LIKE 'A%'or customer.CUS_NAME LIKE '%A';
