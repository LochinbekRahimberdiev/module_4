create table User(
    username varchar(100) not null,
    email varchar(100) not null
);

CREATE TABLE IF NOT EXISTS category (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS olcha (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image VARCHAR(290) NOT NULL,
    price FLOAT NOT NULL,
    is_liked BOOLEAN NOT NULL DEFAULT 'f',
    category_id INT REFERENCES category(id)
);

INSERT INTO category (title)
VALUES ('Telephone'),
       ('Komputer');

INSERT INTO olcha (name, image, price, is_liked, category_id)
VALUES ('Iphone 15', 'iphone15img', 1500, true, 1),
       ('SAMSUNG S20 ultra', 's20jpg', 1600, true, 1),
       ('Redmi note 9', 'minote9jpg', 600, false, 1),
       ('Imach', 'applestorejpg', 2000, false, 2),
       ('Mackbook', 'mackbrostore', 600, true, 2),
       ('HP', 'hp.com/jpg', 650, false, 2);


INSERT INTO User (username, email) VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com');

-- Query to get statistics for each category
SELECT
    name AS category_name,
    COUNT(p.id) AS total_products,
    MAX(p.price) AS max_price,
    MIN(p.price) AS min_price,
    AVG(p.price) AS avg_price
FROM
    Category c
LEFT JOIN
    olcha p ON c.id = p.category_id
GROUP BY
    name;
