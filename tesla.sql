CREATE TABLE dash_tm (
   dash_tm_id SERIAL PRIMARY KEY,
   name VARCHAR(100),
   category_id INT REFERENCES category(category_id)
);

CREATE TABLE service (
   service_id SERIAL PRIMARY KEY,
   name VARCHAR(100),
   group_id INT REFERENCES service_group(group_id)
);

CREATE TABLE service_group (
   group_id SERIAL PRIMARY KEY,
   name VARCHAR(100) UNIQUE
);

CREATE TABLE category (
   category_id SERIAL PRIMARY KEY,
   name VARCHAR(100) UNIQUE
);

CREATE TABLE product (
   product_id SERIAL PRIMARY KEY,
   name VARCHAR(100),
   category_id INT REFERENCES category(category_id),
   price NUMERIC(10, 2)
);

INSERT INTO product (name, category_id, price) VALUES ('Tesla X', 1, 10.99);
INSERT INTO product (name, category_id, price) VALUES ('Gadget Y', 1, 15.99);
INSERT INTO product (name, category_id, price) VALUES ('Shawer', 2, 20.99);
INSERT INTO product (name, category_id, price) VALUES ('Phone case', 2, 25.99);
INSERT INTO product (name, category_id, price) VALUES ('Airpods', 3, 30.99);

SELECT
   dash_tm.name AS dash_tm_name,
   category.name AS category_name,
   product.name AS product_name,
   product.price AS product_price
FROM
   dash_tm
JOIN
   category ON dash_tm.category_id = category.category_id
LEFT JOIN
   (
    SELECT
       service_group.group_id,
       category.category_id
    FROM
       service
    JOIN
       service_group ON service.group_id = service_group.group_id
   ) AS groups ON category.category_id = groups.category_id
JOIN
   product ON product.category_id = category.category_id;
