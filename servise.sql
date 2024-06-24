CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Service (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES Category(category_id)
);

CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_picture TEXT,
    produced_date DATE,
    expiry_date DATE,
    service_id INT REFERENCES Service(service_id)
);

-- Inserting categories
INSERT INTO Category (category_name)
VALUES ('Electronics'),
       ('Clothing'),
       ('Books');

-- Inserting services
INSERT INTO Service (service_name, category_id) VALUES
    ('Smartphones', 1),
    ('Laptops', 1),
    ('T-shirts', 2),
    ('Jeans', 2),
    ('Fiction Books', 3);

-- Inserting products
-- For Smartphones
INSERT INTO Product (product_name, produced_date, expiry_date, service_id) VALUES
    ('iPhone 13', '2023-01-01', '2025-01-01', 1),
    ('Samsung Galaxy S22', '2023-02-01', '2025-02-01', 1),
    ('Google Pixel 6', '2023-03-01', '2025-03-01', 1),
    ('OnePlus 10', '2023-04-01', '2025-04-01', 1),
    ('Xiaomi Mi 12', '2023-05-01', '2025-05-01', 1);

-- For Laptops
INSERT INTO Product (product_name, produced_date, expiry_date, service_id) VALUES
    ('MacBook Pro', '2023-01-01', '2025-01-01', 2),
    ('Dell XPS 15', '2023-02-01', '2025-02-01', 2),
    ('HP Spectre x360', '2023-03-01', '2025-03-01', 2),
    ('Lenovo ThinkPad X1 Carbon', '2023-04-01', '2025-04-01', 2),
    ('Microsoft Surface Laptop 5', '2023-05-01', '2025-05-01', 2);

-- For T-shirts
INSERT INTO Product (product_name, produced_date, expiry_date, service_id) VALUES
    ('Plain White T-shirt', '2023-01-01', '2025-01-01', 3),
    ('Black Graphic Tee', '2023-02-01', '2025-02-01', 3),
    ('Blue Polo Shirt', '2023-03-01', '2025-03-01', 3),
    ('Red V-neck T-shirt', '2023-04-01', '2025-04-01', 3),
    ('Green Striped Tee', '2023-05-01', '2025-05-01', 3);

-- For Jeans
INSERT INTO Product (product_name, produced_date, expiry_date, service_id) VALUES
    ('Slim Fit Jeans', '2023-01-01', '2025-01-01', 4),
    ('Straight Leg Jeans', '2023-02-01', '2025-02-01', 4),
    ('Skinny Jeans', '2023-03-01', '2025-03-01', 4),
    ('Bootcut Jeans', '2023-04-01', '2025-04-01', 4),
    ('Boyfriend Jeans', '2023-05-01', '2025-05-01', 4);

-- For Fiction Books
INSERT INTO Product (product_name, produced_date, expiry_date, service_id) VALUES
    ('1984 by George Orwell', '2023-01-01', '9999-12-31', 5),
    ('To Kill a Mockingbird by Harper Lee', '2023-02-01', '9999-12-31', 5),
    ('The Great Gatsby by F. Scott Fitzgerald', '2023-03-01', '9999-12-31', 5),
    ('Brave New World by Aldous Huxley', '2023-04-01', '9999-12-31', 5),
    ('The Catcher in the Rye by J.D. Salinger', '2023-05-01', '9999-12-31', 5);

-- Update product name
UPDATE Product
SET product_name = 'iPhone 14'
WHERE product_id = 1;

-- Delete a product
DELETE FROM Product
WHERE product_id = 2;

-- Select products along with service names
SELECT
    p.product_id,
    p.product_name,
    s.service_name
FROM
    Product p
JOIN
    Service s ON p.service_id = s.service_id;
