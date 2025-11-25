SELECT SUM(amount) AS total_revenue
FROM Payment;


SELECT 
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS average_price
FROM Product;


SELECT category_id, COUNT(*) AS product_count
FROM Product
GROUP BY category_id
ORDER BY product_count DESC;


SELECT category_id, COUNT(*) AS product_count
FROM Product
GROUP BY category_id
HAVING COUNT(*) > 2;