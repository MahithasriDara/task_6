select * from online_sales.details;
select * from orders;
SELECT
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;
describe orders;

SELECT `Order Date` FROM orders LIMIT 5;


-- Revenue & Orders for Each Year
 SELECT 
	COUNT(DISTINCT `Order ID`) AS total_orders,
	SUM(Amount) AS total_revenue
FROM
	details;
    
   -- joining the table

SELECT
    YEAR(o.`Order Date`) AS order_year,
    MONTH(o.`Order Date`) AS order_month,
    COUNT(DISTINCT o.`Order ID`) AS total_orders,
    SUM(d.Amount) AS total_revenue
FROM
    online_sales.orders o
JOIN
    online_sales.details d
ON
    o.`Order ID` = d.`Order ID`
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;
    
 -- Filter by Specific Date Range
SELECT  
    YEAR(o.`Order Date`) AS order_year,
    MONTH(o.`Order Date`) AS order_month,
    COUNT(DISTINCT o.`Order ID`) AS total_orders,
    SUM(d.Amount) AS total_revenue
FROM
    online_sales.orders o
JOIN
    online_sales.details d
ON
    o.`Order ID` = d.`Order ID`
WHERE
    Month(o.`Order Date`) = 6
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;
    
-- Revenue & Orders for Each Year
SELECT
    YEAR(o.`Order Date`) AS order_year,
    MONTH(o.`Order Date`) AS order_month,
    COUNT(DISTINCT o.`Order ID`) AS total_orders,
    SUM(d.Amount) AS total_revenue,
    ROUND(SUM(d.Amount) / COUNT(DISTINCT o.`Order ID`), 2) AS avg_order_value
FROM
    online_sales.orders o
JOIN
    online_sales.details d
ON
    o.`Order ID` = d.`Order ID`
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

-- Filter by Specific Date Range
SELECT
    YEAR(o.`Order Date`) AS order_year,
    MONTH(o.`Order Date`) AS order_month,
    COUNT(DISTINCT o.`Order ID`) AS total_orders,
    SUM(d.Amount) AS total_revenue
FROM
    online_sales.orders o
JOIN
    online_sales.details d
ON
    o.`Order ID` = d.`Order ID`
WHERE
    o.`Order Date` BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;


-- Top 5 Revenue Months
SELECT
    YEAR(o.`Order Date`) AS order_year,
    MONTH(o.`Order Date`) AS order_month,
    SUM(d.Amount) AS total_revenue
FROM
    online_sales.orders o
JOIN
    online_sales.details d
ON
    o.`Order ID` = d.`Order ID`
GROUP BY
    order_year, order_month
ORDER BY
    total_revenue DESC
LIMIT 5;

-- Average Order Value per Month

SELECT
    YEAR(o.`Order Date`) AS order_year,
    MONTH(o.`Order Date`) AS order_month,
    COUNT(DISTINCT o.`Order ID`) AS total_orders,
    SUM(d.Amount) AS total_revenue,
    ROUND(SUM(d.Amount) / COUNT(DISTINCT o.`Order ID`), 2) AS avg_order_value
FROM
    online_sales.orders o
JOIN
    online_sales.details d
ON
    o.`Order ID` = d.`Order ID`
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;
