-- KPI Views for Supplier Performance System
-- Purpose: Calculate supplier performance metrics for dashboard

-- Main supplier performance view
-- Calculates: orders, deliveries, on-time rate, overall score
-- Used by: Power BI dashboard, reporting

CREATE OR REPLACE VIEW supplier_performance AS
SELECT 
    s.supplier_id,
    s.name,
    s.category,
    COUNT(po.order_id) AS total_orders,
    COUNT(DISTINCT d.delivery_id) AS total_deliveries,
    ROUND(
        (COUNT(CASE WHEN d.is_on_time = TRUE THEN 1 END)::DECIMAL / 
         NULLIF(COUNT(d.delivery_id), 0)) * 100,
        2
    ) AS on_time_delivery_rate,
    ROUND(
        COALESCE(
            (COUNT(CASE WHEN d.is_on_time = TRUE THEN 1 END)::DECIMAL / 
             NULLIF(COUNT(d.delivery_id), 0)) * 60 +
            CASE WHEN COUNT(d.delivery_id) > 0 THEN 40 ELSE 0 END,
            0
        ),
        2
    ) AS overall_score
FROM suppliers s
LEFT JOIN purchase_orders po ON s.supplier_id = po.supplier_id
LEFT JOIN deliveries d ON po.order_id = d.order_id
GROUP BY s.supplier_id, s.name, s.category;

-- Example queries for testing:
-- SELECT * FROM supplier_performance ORDER BY overall_score DESC;
-- SELECT * FROM supplier_performance WHERE on_time_delivery_rate < 80;