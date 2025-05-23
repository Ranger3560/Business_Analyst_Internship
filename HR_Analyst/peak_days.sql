SELECT TO_CHAR(order_date, 'Day') AS day,
    EXTRACT(
        HOUR
        FROM order_time
    ) AS hour,
    SUM(quantity) AS total_pizzas
FROM pizza_sales
GROUP BY day,
    hour
ORDER BY total_pizzas DESC;