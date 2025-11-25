SELECT 
    c.name AS customer_name,
    COUNT(o.order_id) AS orders_count,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM Customer c
LEFT JOIN "Order" o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;


