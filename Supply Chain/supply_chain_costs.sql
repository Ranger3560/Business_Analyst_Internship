-- Total Supply Chain Costs
SELECT Product_type,
    SUM(Manufacturing_costs * Production_volumes) AS total_manufacturing_costs,
    SUM(Shipping_costs) AS total_shipping_costs,
    SUM(
        Manufacturing_costs * Production_volumes + Shipping_costs
    ) AS total_supply_chain_costs,
    SUM(Revenue_generated) AS total_revenue,
    (
        SUM(Revenue_generated) - SUM(
            Manufacturing_costs * Production_volumes + Shipping_costs
        )
    ) AS gross_profit
FROM supply_chain_data
GROUP BY Product_type;
-- Cost Breakdown by Location
SELECT Location,
    AVG(Manufacturing_costs) AS avg_manufacturing_cost,
    AVG(Shipping_costs) AS avg_shipping_cost,
    AVG(Manufacturing_costs + Shipping_costs) AS avg_total_cost_per_unit
FROM supply_chain_data
GROUP BY Location;