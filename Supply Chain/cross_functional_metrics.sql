-- Overall Supply Chain Performance
SELECT AVG(
        Stock_levels / NULLIF(Number_of_products_sold / 30, 0)
    ) AS avg_days_inventory,
    AVG(
        Lead_times + Manufacturing_lead_time + Shipping_times
    ) AS avg_total_lead_time,
    AVG(Defect_rates) AS avg_defect_rate,
    SUM(Revenue_generated) / NULLIF(
        SUM(
            Manufacturing_costs * Production_volumes + Shipping_costs
        ),
        0
    ) AS roi_ratio
FROM supply_chain_data;
-- Product Performance Dashboard
SELECT Product_type,
    SUM(Number_of_products_sold) AS total_sales,
    SUM(Revenue_generated) AS total_revenue,
    AVG(Price) AS avg_price,
    SUM(Manufacturing_costs * Production_volumes) AS total_manufacturing_cost,
    SUM(Shipping_costs) AS total_shipping_cost,
    SUM(Revenue_generated) - SUM(
        Manufacturing_costs * Production_volumes + Shipping_costs
    ) AS gross_profit,
    (
        SUM(Revenue_generated) - SUM(
            Manufacturing_costs * Production_volumes + Shipping_costs
        )
    ) / NULLIF(SUM(Revenue_generated), 0) AS gross_margin
FROM supply_chain_data
GROUP BY Product_type;