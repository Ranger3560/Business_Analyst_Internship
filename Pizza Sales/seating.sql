--Assuming 4 people per order--
SELECT order_date,
    COUNT(DISTINCT order_id) AS orders,
    ROUND((COUNT(DISTINCT order_id) / 15.0) * 100, 2) AS table_utilization_percent,
    ROUND((COUNT(DISTINCT order_id) * 4.0 / 60.0) * 100, 2) AS seat_utilization_percent
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;