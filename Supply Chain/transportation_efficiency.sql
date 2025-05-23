-- Transportation Efficiency Metrics
SELECT Shipping_carriers,
    AVG(Shipping_times) AS avg_shipping_time,
    AVG(Shipping_costs) AS avg_shipping_cost,
    COUNT(*) AS total_shipments,
    AVG(
        Shipping_costs / NULLIF(Number_of_products_sold, 0)
    ) AS cost_per_unit_shipped
FROM supply_chain_data
GROUP BY Shipping_carriers;
-- Carrier Performance by Route
SELECT Shipping_carriers,
    Routes,
    AVG(Shipping_times) AS avg_shipping_time,
    AVG(Shipping_costs) AS avg_shipping_cost,
    COUNT(*) AS shipments_count
FROM supply_chain_data
GROUP BY Shipping_carriers,
    Routes
ORDER BY Shipping_carriers,
    avg_shipping_time;