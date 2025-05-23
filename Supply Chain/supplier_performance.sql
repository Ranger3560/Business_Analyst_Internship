-- Supplier Performance Metrics
SELECT Supplier_name,
    Location,
    AVG(Lead_times) AS avg_lead_time,
    AVG(Defect_rates) AS avg_defect_rate,
    AVG(Manufacturing_costs) AS avg_manufacturing_cost,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN Inspection_results = 'Pass' THEN 1
            ELSE 0
        END
    ) AS passed_inspections,
    SUM(
        CASE
            WHEN Inspection_results = 'Fail' THEN 1
            ELSE 0
        END
    ) AS failed_inspections
FROM supply_chain_data
GROUP BY Supplier_name,
    Location
ORDER BY avg_defect_rate,
    avg_lead_time;
-- Supplier Scorecard
SELECT Supplier_name,
    (
        AVG(Lead_times) * 0.4 + AVG(Defect_rates) * 0.3 + AVG(Manufacturing_costs) * 0.3
    ) AS performance_score
FROM supply_chain_data
GROUP BY Supplier_name
ORDER BY performance_score;