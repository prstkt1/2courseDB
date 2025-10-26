CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    category_id INT NOT NULL,
    CONSTRAINT fk_category
        FOREIGN KEY(category_id) 
        REFERENCES Category(category_id)
        ON DELETE RESTRICT
);


CREATE TABLE "Order" (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),
    customer_id INT NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id) 
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE -- Якщо клієнт видаляється, його замовлення також видаляються
);


CREATE TABLE OrderItem (
    order_item_id SERIAL PRIMARY KEY,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10, 2) NOT NULL,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT fk_order
        FOREIGN KEY(order_id) 
        REFERENCES "Order"(order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_product
        FOREIGN KEY(product_id) 
        REFERENCES Product(product_id)
        ON DELETE RESTRICT,
    UNIQUE (order_id, product_id)
);


CREATE TABLE Payment (
    payment_id SERIAL PRIMARY KEY,
    payment_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    method VARCHAR(50) NOT NULL,
    order_id INT NOT NULL UNIQUE,
    CONSTRAINT fk_payment_order
        FOREIGN KEY(order_id) 
        REFERENCES "Order"(order_id)
        ON DELETE CASCADE
);