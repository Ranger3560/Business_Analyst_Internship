SELECT DATE_TRUNC('month', order_date::date) AS month,
    ROUND(SUM(total_price), 2) AS revenue
FROM pizza_sales
GROUP BY month
ORDER BY revenue DESC
LIMIT 1;