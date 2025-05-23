-- Days of Inventory Remaining
SELECT SKU,
    Product_type,
    Location,
    Stock_levels,
    AVG(Number_of_products_sold / 30) AS avg_daily_sales,
    Stock_levels / NULLIF(AVG(Number_of_products_sold / 30), 0) AS days_of_inventory_remaining
FROM supply_chain_data
GROUP BY SKU,
    Product_type,
    Location,
    Stock_levels;
-- Inventory Turnover
SELECT Product_type,
    Location,
    AVG(Number_of_products_sold) AS avg_monthly_sales,
    AVG(Stock_levels) AS avg_inventory,
    AVG(Number_of_products_sold) / NULLIF(AVG(Stock_levels), 0) AS inventory_turnover_ratio
FROM supply_chain_data
GROUP BY Product_type,
    Location;