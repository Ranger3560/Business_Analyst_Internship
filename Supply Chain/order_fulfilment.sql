-- On-Time Delivery Rate
WITH avg_shipping_time AS (
    SELECT AVG(Shipping_times) AS avg_time
    FROM supply_chain_data
)
SELECT Product_type,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN s.Shipping_times <= a.avg_time THEN 1
            ELSE 0
        END
    ) AS on_time_orders,
    (
        SUM(
            CASE
                WHEN s.Shipping_times <= a.avg_time THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*)
    ) AS on_time_percentage
FROM supply_chain_data s,
    avg_shipping_time a
GROUP BY Product_type;
-- Average Order Processing Time
SELECT Product_type,
    AVG(
        Lead_times + Manufacturing_lead_time + Shipping_times
    ) AS avg_total_processing_time
FROM supply_chain_data
GROUP BY Product_type;