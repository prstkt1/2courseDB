SELECT 
    oi.order_id,
    p.name AS product_name,
    oi.quantity,
    oi.price AS unit_price
FROM OrderItem oi
INNER JOIN Product p ON oi.product_id = p.product_id;

SELECT 
    c.name AS customer_name,
    o.order_id,
    o.total_amount
FROM Customer c
LEFT JOIN "Order" o ON c.customer_id = o.customer_id;


SELECT 
    p.name AS product_name,
    c.name AS category_name
FROM Product p
RIGHT JOIN Category c ON p.category_id = c.category_id;