-- Create Role table
CREATE TABLE Role (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Insert data into Role table
INSERT INTO Role (name) VALUES
    ('Admin'),
    ('User'),
    ('Guest');

-- Create User table
CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT REFERENCES Role(id)
);

-- Create Category table
CREATE TABLE Category (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    role_id INT REFERENCES Role(id)
);

-- Create Group table
CREATE TABLE "Group" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES Category(id)
);

-- Create Service table
CREATE TABLE Service (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    group_id INT REFERENCES "Group"(id)
);

-- Insert data into Role table
INSERT INTO Role (name) VALUES
    ('Admin'),
    ('User'),
    ('Guest');

-- Insert data into User table
INSERT INTO "User" (username, password, email, role_id) VALUES
    ('admin_user', 'admin123', 'admin@example.com', 1),
    ('user1', 'user123', 'user1@example.com', 2),
    ('user2', 'user456', 'user2@example.com', 2),
    ('guest1', 'guest123', 'guest1@example.com', 3),
    ('guest2', 'guest456', 'guest2@example.com', 3),
    ('guest3', 'guest789', 'guest3@example.com', 3),
    ('guest4', 'guestabc', 'guest4@example.com', 3);

-- Insert data into Category table
INSERT INTO Category (title, role_id) VALUES
    ('Electronics', 1),
    ('Clothing', 2),
    ('Books', 3),
    ('Toys', 1),
    ('Home Appliances', 2),
    ('Sports', 3),
    ('Beauty', 1);

-- Insert data into Group table
INSERT INTO "Group" (name, category_id) VALUES
    ('Smartphones', 1),
    ('T-shirts', 2),
    ('Fiction Books', 3),
    ('Action Figures', 4),
    ('Kitchen Appliances', 5),
    ('Football', 6),
    ('Makeup', 7);

-- Insert data into Service table
INSERT INTO Service (name, group_id) VALUES
    ('iPhone 13', 1),
    ('Samsung Galaxy S22', 1),
    ('Plain White T-shirt', 2),
    ('Black Graphic Tee', 2),
    ('1984 by George Orwell', 3),
    ('To Kill a Mockingbird by Harper Lee', 3),
    ('Barbie Doll', 4),
    ('LEGO Set', 4),
    ('Blender', 5),
    ('Coffee Maker', 5),
    ('Soccer Ball', 6),
    ('Basketball', 6),
    ('Lipstick', 7),
    ('Eyeshadow Palette', 7);
CREATE OR REPLACE FUNCTION delete_category_with_move(category_id INT, new_category_id INT) RETURNS VOID AS $$
BEGIN
    IF new_category_id IS NOT NULL THEN
        -- Move products to the new category
        PERFORM move_products_to_new_category(category_id, new_category_id);
    END IF;

    -- Delete the category
    DELETE FROM Category WHERE category_id = category_id;
END;
$$ LANGUAGE plpgsql;
