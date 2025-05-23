SELECT TO_CHAR(order_date, 'Day') AS weekday,
    EXTRACT(
        HOUR
        FROM order_time
    ) AS hour,
    COUNT(order_id) AS order_count
FROM pizza_sales
GROUP BY weekday,
    hour
ORDER BY order_count DESC;