--Total Revenue--
SELECT ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;
--Total Orders--
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;
--Highest Revenue-Generating Pizza--
SELECT pizza_name,
    ROUND(SUM(total_price), 2) AS revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 1;
--Daily Revenue--
SELECT order_date,
    ROUND(SUM(total_price), 2) AS daily_revenue
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;
--Revenue by Pizza Category--
SELECT pizza_category,
    ROUND(SUM(total_price), 2) AS revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY revenue DESC;