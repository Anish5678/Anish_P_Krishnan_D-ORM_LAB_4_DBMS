-- Q1. Create Tables for supplier, customer, category, product, suppier_pricin, order, rating.alter

use `ecommerce`;
CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);
-- Create table customer
CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));
-- Create table category



-- Create table


-- Create table


-- Create table


-- Create table


-- Create table

-- Create table
