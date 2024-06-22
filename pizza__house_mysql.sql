use pizza_house;
CREATE TABLE `orders` (
    `row_id` int NOT NULL,
    `order_id` varchar(10) NOT NULL,
    `created_at` datetime NOT NULL,
    `item_id` varchar(10) NOT NULL,
    `quantity` int NOT NULL,
    `cust_id` int NOT NULL,
    `delivery` boolean NOT NULL,
    `add_id` int NOT NULL,
    PRIMARY KEY (`row_id`)
);

CREATE TABLE `customers` (
    `cust_id` int NOT NULL,
    `cust_firstname` varchar(50) NOT NULL,
    `cust_lastname` varchar(50) NOT NULL,
    PRIMARY KEY (`cust_id`)
);

CREATE TABLE `address` (
    `add_id` int NOT NULL,
    `delivery_address1` varchar(200) NOT NULL,
    `delivery_address2` varchar(200) NULL,
    `delivery_city` varchar(50) NOT NULL,
    `delivery_zipcode` varchar(20) NOT NULL,
    PRIMARY KEY (`add_id`)
);

CREATE TABLE `item` (
    `item_id` varchar(10) NOT NULL,
    `sku` varchar(20) NOT NULL,
    `item_name` varchar(100) NOT NULL,
    `item_cat` varchar(100) NOT NULL,
    `item_size` varchar(10) NOT NULL,
    `item-price` decimal(10,2) NOT NULL,
    PRIMARY KEY (`item_id`)
);

CREATE TABLE `recipe` (
    `row_id` int NOT NULL,
    `recipe_id` varchar(20) NOT NULL,
    `ing_id` varchar(10) NOT NULL,
    `quantity` int NOT NULL,
    PRIMARY KEY (`row_id`)
);

CREATE TABLE `ingredient` (
    `ing_id` varchar(10) NOT NULL,
    `ing_name` varchar(200) NOT NULL,
    `ing_weight` int NOT NULL,
    `int_meas` varchar(20) NOT NULL,
    `ing_price` decimal(5,2) NOT NULL,
    PRIMARY KEY (`ing_id`)
);

CREATE TABLE `inventory` (
    `inv_id` int NOT NULL,
    `item_id` varchar(10) NOT NULL,
    `quantity` int NOT NULL,
    PRIMARY KEY (`inv_id`)
);

CREATE TABLE `staff` (
    `staff_id` varchar(20) NOT NULL,
    `first_name` varchar(50) NOT NULL,
    `last_name` varchar(50) NOT NULL,
    `email` varchar(100) NOT NULL,
    PRIMARY KEY (`staff_id`)
);
-- Insert data into customers
INSERT INTO customers (cust_id, cust_firstname, cust_lastname) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

-- Insert data into address
INSERT INTO address (add_id, delivery_address1, delivery_address2, delivery_city, delivery_zipcode) VALUES
(1, '123 Elm Street', NULL, 'Springfield', '12345'),
(2, '456 Oak Avenue', 'Apt 7', 'Shelbyville', '67890');

-- Insert data into item
INSERT INTO item (item_id, sku, item_name, item_cat, item_size, `item-price`) VALUES
('A1', 'SKU001', 'Widget', 'Gadgets', 'M', 19.99),
('B2', 'SKU002', 'Gizmo', 'Gadgets', 'L', 29.99);

-- Insert data into ingredient
INSERT INTO ingredient (ing_id, ing_name, ing_weight, int_meas, ing_price) VALUES
('I1', 'Flour', 1000, 'grams', 2.50),
('I2', 'Sugar', 500, 'grams', 1.75);

-- Insert data into recipe
INSERT INTO recipe (row_id, recipe_id, ing_id, quantity) VALUES
(1, 'R1', 'I1', 200),
(2, 'R1', 'I2', 100);

-- Insert data into inventory
INSERT INTO inventory (inv_id, item_id, quantity) VALUES
(1, 'A1', 50),
(2, 'B2', 30);

-- Insert data into staff
INSERT INTO staff (staff_id, first_name, last_name, email) VALUES
('S1', 'Alice', 'Johnson', 'alice@example.com'),
('S2', 'Bob', 'Williams', 'bob@example.com');

-- Insert data into orders
INSERT INTO orders (row_id, order_id, created_at, item_id, quantity, cust_id, delivery, add_id) VALUES
(1, 'ORD001', '2023-06-22 10:00:00', 'A1', 2, 1, TRUE, 1),
(2, 'ORD002', '2023-06-22 11:00:00', 'B2', 1, 2, FALSE, 2);

SELECT * FROM customers;
SELECT * FROM orders WHERE cust_id = 1;
UPDATE customers SET cust_firstname = 'Jonathan' WHERE cust_id = 1;
DELETE FROM orders WHERE order_id = 'ORD002';

SELECT o.order_id, o.created_at, c.cust_firstname, c.cust_lastname, i.item_name, o.quantity, a.delivery_address1, a.delivery_city, a.delivery_zipcode
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id
JOIN item i ON o.item_id = i.item_id
JOIN address a ON o.add_id = a.add_id;





