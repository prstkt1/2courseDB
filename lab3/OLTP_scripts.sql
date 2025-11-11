-- INSERT


INSERT INTO Category (name) VALUES
('Зоотовари'),
('Побутова хімія'),
('Дитячі товари');

INSERT INTO Customer (name, email, phone) VALUES
('user5', 'user.5@example.com', '+380533134567'),
('user6', 'user.6@example.com', '+380555534567'),
('user7', 'user.7@example.com', '+380973243567'),
('user8', 'user.8@example.com', '+386521234567');

INSERT INTO Product (name, description, price, stock_quantity, category_id) VALUES
('Смартфон2', 'Нова модель з AI', 29999.99, 50, 1),
('Ноутбук2', 'Для професіоналів', 45000.00, 20, 1),
('Книга2', 'Навчальний посібник', 850.00, 100, 2),
('Футболка2', 'Бавовна 100%', 600.00, 250, 3);

INSERT INTO "Order" (customer_id, total_amount) VALUES
(1, 0.00),
(2, 0.00), 
(1, 0.00); 

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 29999.99),
(1, 3, 2, 850.00);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(2, 4, 3, 600.00);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(3, 2, 1, 45000.00);



-- UPDATE

UPDATE "Order"
SET total_amount = (SELECT SUM(quantity * price) FROM OrderItem WHERE order_id = 1)
WHERE order_id = 1;

UPDATE "Order"
SET total_amount = (SELECT SUM(quantity * price) FROM OrderItem WHERE order_id = 2)
WHERE order_id = 2;

UPDATE "Order"
SET total_amount = (SELECT SUM(quantity * price) FROM OrderItem WHERE order_id = 3)
WHERE order_id = 3;

INSERT INTO Payment (order_id, amount, method) VALUES
(1, 31699.99, 'Credit Card'),
(2, 1800.00, 'PayPal');


UPDATE Customer
SET email = 'user1.new@example.com'
WHERE customer_id = 1;

UPDATE Product
SET stock_quantity = stock_quantity - 1
WHERE name = 'Смартфон1"';



-- SELECT

SELECT * FROM Customer;

SELECT name, price
FROM Product
WHERE price > 10000;



SELECT name, email
FROM Customer
WHERE name = '3user';



SELECT o.order_id, o.order_date, o.total_amount, c.name
FROM "Order" AS o
JOIN Customer AS c ON o.customer_id = c.customer_id;



SELECT 
    p.name AS "Назва товару",
    oi.quantity AS "Кількість",
    oi.price AS "Ціна за одиницю"
FROM OrderItem AS oi
JOIN Product AS p ON oi.product_id = p.product_id
WHERE oi.order_id = 1;


-- DELETE

DELETE FROM OrderItem
WHERE order_id = 1 AND product_id = 3;

DELETE FROM "Order"
WHERE order_id = 2;