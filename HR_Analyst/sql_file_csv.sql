COPY pizza_sales (
    order_details_id,
    order_id,
    pizza_id,
    quantity,
    order_date,
    order_time,
    unit_price,
    total_price,
    pizza_size,
    pizza_category,
    pizza_ingredients,
    pizza_name
)
FROM 'E:\Unified Mentor Final Project\Pizza Sales\Data Model - Pizza Sales.csv' DELIMITER ',' CSV HEADER;