-- Example queries
-- Revenue by category per month
SELECT date_trunc('month', order_date) AS month, category,
       SUM(qty * unit_price * (1 - COALESCE(discount,0))) AS revenue
FROM sales s
JOIN products p USING (sku)
GROUP BY 1,2
ORDER BY 1,2;

-- Inventory ageing buckets
SELECT snapshot_date, store_id, sku,
       CASE
         WHEN DATE_PART('day', COALESCE(expiry_date, snapshot_date + INTERVAL '9999 days') - snapshot_date) <= 3 THEN '0-3'
         WHEN DATE_PART('day', COALESCE(expiry_date, snapshot_date + INTERVAL '9999 days') - snapshot_date) <= 7 THEN '4-7'
         WHEN DATE_PART('day', COALESCE(expiry_date, snapshot_date + INTERVAL '9999 days') - snapshot_date) <= 14 THEN '8-14'
         ELSE '15+'
       END AS ageing_band,
       on_hand
FROM inventory;
