-- Customer, Product and Order Management Database
-- MySQL beginner project

CREATE DATABASE college;
USE college;

CREATE TABLE customers (
    customers_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_data DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customers_id)
);

INSERT INTO customers (name, email, city) VALUES
('rahul sharma', 'rahul@gmail.com', 'delhi'),
('pooja varma', 'pooja@gmail.com', 'bengaluru'),
('amit patel', 'amit@gmail.com', 'mumbai'),
('sneha roy', 'sneha@gmail.com', 'kolkata');

INSERT INTO products (product_name, category, price, stock) VALUES
('wireless mouse', 'electronics', 699.00, 45),
('mechanical keyboard', 'electronics', 2499.00, 15),
('running shoes', 'footwear', 1899.00, 30),
('water bottle', 'home and kitchen', 349.00, 80);

INSERT INTO orders (customer_id, order_data, total_amount) VALUES
(1, '2026-10-01', 699.00),
(2, '2026-10-05', 2499.00),
(3, '2026-10-12', 1899.00),
(4, '2026-10-15', 349.00);

-- Verify each table
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

-- Display customer details along with their order details
SELECT
    customers.name,
    customers.city,
    orders.order_id,
    orders.total_amount,
    orders.order_data
FROM customers
INNER JOIN orders
    ON customers.customers_id = orders.customer_id;
