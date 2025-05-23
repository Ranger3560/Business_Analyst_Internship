--Most Popular Pizza--
SELECT pizza_name,
    SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 1;
--Pizza Size Popularity--
SELECT pizza_size,
    SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_sold DESC;