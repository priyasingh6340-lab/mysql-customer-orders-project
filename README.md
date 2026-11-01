# Customer, Product and Order Management Database (MySQL)

A beginner-level SQL project built using **MySQL** and **MySQL Workbench**. The project demonstrates how to create a relational database, define tables, insert sample records, retrieve data, and combine related records using an `INNER JOIN`.

## Project overview

The database is named `college` and contains three tables:

- **customers** – stores customer details such as name, email address and city.
- **products** – stores product details such as product name, category, price and available stock.
- **orders** – stores order details, including the customer who placed the order, order date (`order_data`) and total amount.

The `orders.customer_id` column is a foreign key linked to `customers.customers_id`. This establishes a relationship between customers and their orders.

## Tools used

- MySQL Server
- MySQL Workbench
- SQL

## Database structure

```text
college
├── customers
│   ├── customers_id (Primary Key)
│   ├── name
│   ├── email
│   └── city
│
├── products
│   ├── product_id (Primary Key)
│   ├── product_name
│   ├── category
│   ├── price
│   └── stock
│
└── orders
    ├── order_id (Primary Key)
    ├── customer_id (Foreign Key)
    ├── order_data
    └── total_amount
```

### Relationship

```text
customers.customers_id  1 ─────────── many  orders.customer_id
```

One customer can have multiple orders. Each order is associated with a customer through the foreign key.

## Work completed

### 1. Create the database

```sql
CREATE DATABASE college;
USE college;
```

### 2. Create the customers table

```sql
CREATE TABLE customers (
    customers_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
```

### 3. Create the products table

```sql
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);
```

### 4. Create the orders table

```sql
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_data DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customers_id)
);
```

### 5. Insert customer records

```sql
INSERT INTO customers (name, email, city) VALUES
('rahul sharma', 'rahul@gmail.com', 'delhi'),
('pooja varma', 'pooja@gmail.com', 'bengaluru'),
('amit patel', 'amit@gmail.com', 'mumbai'),
('sneha roy', 'sneha@gmail.com', 'kolkata');
```

### 6. Insert product records

```sql
INSERT INTO products (product_name, category, price, stock) VALUES
('wireless mouse', 'electronics', 699.00, 45),
('mechanical keyboard', 'electronics', 2499.00, 15),
('running shoes', 'footwear', 1899.00, 30),
('water bottle', 'home and kitchen', 349.00, 80);
```

### 7. Insert order records

```sql
INSERT INTO orders (customer_id, order_data, total_amount) VALUES
(1, '2026-10-01', 699.00),
(2, '2026-10-05', 2499.00),
(3, '2026-10-12', 1899.00),
(4, '2026-10-15', 349.00);
```

### 8. Retrieve and verify table data

The following queries display all records from each table:

```sql
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
```

The result grids in MySQL Workbench were used to verify that the inserted records appeared in the respective tables.

### 9. Retrieve related data using INNER JOIN

To display customer information together with their order details, an `INNER JOIN` was performed using the matching customer ID:

```sql
SELECT
    customers.name,
    customers.city,
    orders.order_id,
    orders.total_amount,
    orders.order_data
FROM customers
INNER JOIN orders
    ON customers.customers_id = orders.customer_id;
```

This query returns rows where a customer record has a matching order record. It displays the customer's name and city along with the order ID, total amount and order date.

## Screenshots

The screenshots below show the work performed in MySQL Workbench. They are stored in the repository's `screenshots/` folder.

### 1. Customers table and inserted records

![Customers table](screenshots/01_customers_table.png)

### 2. Products table and inserted records

![Products table](screenshots/02_products_table.png)

### 3. Orders table and inserted records

![Orders table](screenshots/03_orders_table.png)

### 4. INNER JOIN query and output

![INNER JOIN result](screenshots/04_inner_join_result.png)

## How to run this project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your local MySQL instance.
3. Open the `sql/project.sql` file from this repository (or copy the SQL statements into a new query tab).
4. Execute the script from top to bottom.
5. Refresh the **Schemas** panel and confirm that the `college` database and its tables are present.
6. Run the `SELECT` and `INNER JOIN` queries to view and verify the results.

> **Note:** The script creates a new database named `college`. If a database with that name already exists and contains data you need, back it up before running any reset or drop commands. This project script does not drop an existing database.

## Concepts practised

- Creating a database with `CREATE DATABASE`
- Selecting a database with `USE`
- Creating tables with `CREATE TABLE`
- Defining primary keys and auto-increment columns
- Defining a foreign key to establish a table relationship
- Inserting multiple records with `INSERT INTO`
- Retrieving records with `SELECT`
- Understanding relational data
- Combining records from two tables using `INNER JOIN`

## Repository structure

```text
mysql-customer-orders-project/
│
├── README.md
├── sql/
│   └── project.sql
└── screenshots/
    ├── 01_customers_table.png
    ├── 02_products_table.png
    ├── 03_orders_table.png
    └── 04_inner_join_result.png
```

## Future improvements

- Add more customers, products and orders.
- Add `NOT NULL`, `UNIQUE` and `CHECK` constraints where appropriate.
- Add queries using `LEFT JOIN`, `GROUP BY`, `ORDER BY` and aggregate functions.
- Create reports showing total orders and spending per customer.
- Add an order-items table to connect individual products to each order.

---

**Project status:** Completed – database creation, sample data insertion, table verification and an `INNER JOIN` query demonstrated in MySQL Workbench.
