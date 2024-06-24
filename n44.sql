-- Create the category schema
CREATE SCHEMA IF NOT EXISTS category;

-- Create the category table with a custom sequence for the id
CREATE TABLE IF NOT EXISTS category.categories (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Create the product schema
CREATE SCHEMA IF NOT EXISTS product;

-- Create the product table with a custom sequence for the id
CREATE TABLE IF NOT EXISTS product.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    image VARCHAR(255),
    is_liked BOOLEAN NOT NULL DEFAULT false
);
-- Insert values into the products table
INSERT INTO product.products (name, price, image, is_liked) VALUES
    ('pepsi', 49.99, 'image1.jpg', true),
    ('telephone ', 29.99, 'image2.jpg', false),
    ('computer', 39.99, 'image3.jpg', true),
    ('washing machine', 59.99, 'image4.jpg', false),
    ('fridge', 79.99, 'image5.jpg', true),
    ('lap-top', 99.99, 'image6.jpg', false);

-- Alter table names
ALTER TABLE category.categories RENAME TO categories;
ALTER TABLE product.products RENAME TO products;
