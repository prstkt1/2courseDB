SELECT name, price
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);


SELECT 
    c.name,
    c.email,
    (SELECT COUNT(*) FROM "Order" o WHERE o.customer_id = c.customer_id) AS total_orders
FROM Customer c;


SELECT name 
FROM Customer
WHERE customer_id IN (
    SELECT o.customer_id 
    FROM "Order" o
    JOIN OrderItem oi ON o.order_id = oi.order_id
    JOIN Product p ON oi.product_id = p.product_id
    WHERE p.name = 'Ноутбук1'
);