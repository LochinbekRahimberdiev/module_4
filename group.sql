-- Tables for different product categories
CREATE TABLE electronics (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE demographics (
    id INT,
    age INT
);

CREATE TABLE departments (
    id INT,
    department VARCHAR(50)
);

-- Data insertion for different product categories
INSERT INTO electronics (id, name) VALUES (1, 'Phone'), (2, 'Laptop'), (3, 'Tablet');
INSERT INTO demographics (id, age) VALUES (1, 30), (2, 25), (3, 35);
INSERT INTO departments (id, department) VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

-- Union case combining different product categories
SELECT id, name, NULL AS age, NULL AS department FROM electronics
UNION
SELECT id, NULL AS name, age, NULL AS department FROM demographics
UNION
SELECT id, NULL AS name, NULL AS age, department FROM departments;

-- Intersect case combining different product categories
SELECT id, name, NULL AS age, NULL AS department FROM electronics
INTERSECT
SELECT id, NULL AS name, age, NULL AS department FROM demographics
INTERSECT
SELECT id, NULL AS name, NULL AS age, department FROM departments;

-- Example of sales data with grouping sets, cube, and rollup
CREATE TABLE sales (
    region VARCHAR(50),
    product VARCHAR(50),
    amount INT
);

-- Inserting sales data
INSERT INTO sales (region, product, amount) VALUES ('East', 'Phone', 1000), ('West', 'Laptop', 2000), ('East', 'Laptop', 1500), ('West', 'Phone', 1200);

-- Grouping sets example
SELECT region, product, SUM(amount) AS total_amount
FROM sales
GROUP BY GROUPING SETS ((region, product), (region), (product), ());

-- Cube example
SELECT region, product, SUM(amount) AS total_amount
FROM sales
GROUP BY CUBE (region, product);

-- Rollup example
SELECT region, product, SUM(amount) AS total_amount
FROM sales
GROUP BY ROLLUP (region, product);