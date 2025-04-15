CREATE DATABASE Choclate_sales;

USE choclate_sales;

CREATE TABLE choclate_sales_detail(
sales_person VARCHAR(100),
Country VARCHAR(50),
Product VARCHAR(100),
Date DATE,
Amount INT,
Boxes_shipped INT);

SELECT * FROM choclate_sales_detail;

SELECT COUNT(*) FROM choclate_sales_detail;

-- Top 5 Products by Sales--

SELECT Product, SUM(Amount) as Total_Revenue
from choclate_sales_detail
GROUP BY product
ORDER BY Total_Revenue DESC
LIMIT 5;


-- Country-wise Performance --

SELECT Country, SUM(Amount) Total_sales, COUNT(*) AS orders
FROM choclate_sales_detail
GROUP BY Country
ORDER BY orders DESC;

-- Sales person Performance -- 

SELECT Sales_person, SUM(Amount) AS Total_sale, COUNT(*) As Order_Generate
FROM choclate_sales_detail
GROUP BY sales_person
ORDER BY Order_Generate DESC
LIMIT 10;


-- Total Boxes Shipped Over Time -- 

SELECT
  date_format(date, '%Y-%m') AS month,
  SUM(Boxes_shipped) AS total_boxes
FROM choclate_sales_detail
GROUP BY month
ORDER BY month;


-- monthly revenue and order volume-- 

SELECT
  DATE_FORMAT(date, '%Y-%m') AS month,
  SUM(Amount) AS total_revenue,
  COUNT(*) AS total_orders
FROM choclate_sales_detail
GROUP BY month
ORDER BY month;
