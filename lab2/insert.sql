INSERT INTO Category (name) VALUES
('Електроніка'),
('Книги'),
('Одяг'),
('Спортивні товари');


INSERT INTO Customer (name, email, phone) VALUES
('1user', 'user.1@gmail.com', '+380501234567'),
('2user', 'user.2@gmail.com', '+380679876543'),
('3user', 'user.3gmail.com', '+380931112233'),
('4user', 'user.4@gmail.com', '+380934445566');


INSERT INTO Product (name, description, price, stock_quantity, category_id) VALUES
('Смартфон "Galaxy S25"', 'Флагманський смартфон з покращеною камерою', 35000.00, 50, 1),
('Ноутбук "ThinkPad X1"', 'Ультрабук для бізнесу', 62000.50, 30, 1),
('Книга "Мистецтво програмування"', 'Класичний твір Дональда Кнута', 1200.00, 100, 2),
('Футболка "Classic"', 'Бавовняна футболка, білий колір', 750.00, 200, 3),
('Бігові кросівки "FlyRun"', 'Легкі кросівки для бігу', 3200.00, 80, 4);


INSERT INTO "Order" (customer_id, total_amount, order_date) VALUES
(1, 38200.00, '2025-10-20 10:00:00'),
(2, 750.00, '2025-10-22 14:30:00'),
(1, 62000.50, '2025-10-23 18:00:00'),
(3, 4400.00, '2025-10-24 11:15:00');


INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 35000.00), 
(1, 5, 1, 3200.00),  
(2, 4, 1, 750.00),   
(3, 2, 1, 62000.50), 
(4, 3, 1, 1200.00),
(4, 5, 1, 3200.00);


INSERT INTO Payment (order_id, amount, method, payment_date) VALUES
(1, 38200.00, 'Credit Card', '2025-10-20 10:01:00'),
(2, 750.00, 'PayPal', '2025-10-22 14:31:00'),
(3, 62000.50, 'Credit Card', '2025-10-23 18:02:00'),
(4, 4400.00, 'Bank Transfer', '2025-10-24 11:20:00');