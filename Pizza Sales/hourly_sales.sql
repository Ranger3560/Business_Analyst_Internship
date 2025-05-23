SELECT EXTRACT(
        HOUR
        FROM order_time::time
    ) AS hour,
    SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY hour
ORDER BY hour;