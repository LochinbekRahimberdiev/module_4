--Rahimberdiyev Lochinbek Variant-B
--1-masala.create database new_db . data sourse -->postgresql->postgresql -> name kiritamiz, data baseni tanlaymiz .
-- 2-masala student_id_sequence nomli sequence yaratasizlar


--  Sequence yaratish
CREATE SEQUENCE student_id_sequence
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- 2. Students jadvali yaratish (agar mavjud bo'lmasa)
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- 3. Yangi talaba qo'shish
INSERT INTO students (student_id, name, age)
VALUES (nextval('student_id_sequence'), 'Jamol Kamalov', 22);




-- 3-masala Student nomli jadval yaratasizlar. Attributelari : id => sequence id , full_name, last_name,
-- Age, email (unique), created_at (timestamptz)


    -- 1. Sequence yaratish
CREATE SEQUENCE student_id_sequence
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

-- 2. Student jadvali yaratish
CREATE TABLE Student (
    id INT PRIMARY KEY DEFAULT nextval('student_id_sequence'),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Misol uchun yangi talaba qo'shish
INSERT INTO Student (first_name, last_name, age, email)
VALUES ('Jahongir', 'Dolimov', 20, 'joxa@gmial.com');

-- 4-masala Student nomli table yaratib bo’lgandan so’ng
-- qo’shimcha ravishda phone_number nomli column qo’shasizlar va
-- jadvalga 10 ta data qo’shasizlar

ALTER TABLE Student
    add column phone_number varchar (100);


INSERT INTO Student (first_name, last_name, age, email, phone_number)
VALUES
('Alice', 'Smith', 22, 'alice.smith@example.com', '123-456-7890'),
('Bob', 'Johnson', 21, 'bob.johnson@example.com', '234-567-8901'),
('Charlie', 'Brown', 23, 'charlie.brown@example.com', '345-678-9012'),
('David', 'Wilson', 20, 'david.wilson@example.com', '456-789-0123'),
('Eva', 'Martinez', 22, 'eva.martinez@example.com', '567-890-1234'),
('Frank', 'Miller', 24, 'frank.miller@example.com', '678-901-2345'),
('Grace', 'Lee', 21, 'grace.lee@example.com', '789-012-3456'),
('Hannah', 'Davis', 23, 'hannah.davis@example.com', '890-123-4567'),
('Ivan', 'Walker', 22, 'ivan.walker@example.com', '901-234-5678'),
('Julia', 'Harris', 20, 'julia.harris@example.com', '012-345-6789');



--5.Full_name uzunligi 5 dan katta va yoshi 18 dan kichik studentlarni tanlab olinglar.

SELECT *
FROM Student
WHERE LENGTH(first_name) > 5
AND age < 18;


---- 6.Customers (customer_id,customer_name,customer_email),
--Products(product_id,product_name,price),
--Orders (order_id,order_date,customer_id,product_id,quantity)
--nomli jadvallar yaratasizlar .Va ushbu jadvallarni ma’lumot bilan to’ldirib


-- Customers jadvali yaratish
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE NOT NULL
);

-- Products jadvali yaratish
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Orders jadvali yaratish
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMPTZ DEFAULT NOW(),
    customer_id INT REFERENCES Customers(customer_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL
);
INSERT INTO Customers (customer_name, customer_email)
VALUES
('Murad', 'murad@example.com'),
('Jamila', 'jamila@example.com'),
('Aliya', 'aliya@example.com'),
('Bobomurod', 'bobomurod@example.com'),
('Luiza', 'Luiza@example.com');
INSERT INTO Products (product_name, price)
VALUES
('Laptop', 999.99),
('Smartphone', 499.99),
('Tablet', 299.99),
('Headphones', 89.99),
('Smartwatch', 199.99);
INSERT INTO Orders (customer_id, product_id, quantity)
VALUES
(1, 1, 2), -- Murad buys 2 Laptops
(2, 2, 1), -- Jamilabuys 1 Smartphone
(3, 3, 3), -- Aliya buys 3 Tablets
(4, 4, 1), -- Bobomurod buys 1 Headphones
(5, 5, 2), --Luiza buys 2 Smartwatches
(1, 3, 1), -- Murad buys 1 Tablet
(2, 4, 2), -- Jamila buys 2 Headphones
(3, 5, 1), -- Aliya buys 1 Smartwatch
(4, 2, 1), -- Bobomurod buys 1 Smartphone
(5, 1, 1); -- Luiza buys 1 Laptop

--7-masala . Va ushbu uchala jadvallarni bir biriga qo’shib chiqasizlar (inner join orqali).


           SELECT
    Orders.order_id,
    Orders.order_date,
    Customers.customer_id,
    Customers.customer_name,
    Customers.customer_email,
    Products.product_id,
    Products.product_name,
    Products.price,
    Orders.quantity
FROM
    Orders
INNER JOIN
    Customers ON Orders.customer_id = Customers.customer_id
INNER JOIN
    Products ON Orders.product_id = Products.product_id;


-- 8-masala Select orqali like , order by , group by caselarini ishlatib ko’rsatasizlar

SELECT *
FROM Customers
WHERE customer_name LIKE 'M%';

SELECT *
FROM Products
ORDER BY price ASC;


SELECT product_id, SUM(quantity) AS total_quantity
FROM Orders
GROUP BY product_id;
SELECT
    P.product_name,
    SUM(O.quantity) AS total_quantity,
    C.customer_name
FROM
    Orders O
INNER JOIN
    Customers C ON O.customer_id = C.customer_id
INNER JOIN
    Products P ON O.product_id = P.product_id
WHERE 
    C.customer_name LIKE 'J%'
GROUP BY
    P.product_name, C.customer_name
ORDER BY
    total_quantity DESC;
CREATE SCHEMA exem;

SET SEARCH_PATH TO exem;

-- Jalilov Zoirjon A - Variant

-- 1-Misol

-- \l  =>  databaselarni nomini chiqaradi ( bor databaselarni ma’lumotlarini ko’rish )
-- \c =>  o’zimiz turgan databasedan boshqa databasega o’tish
-- Drop
-- => databaseni o’chirish ( example: drop database testing_db; )
-- Lekin testing_db nomli databasedan chiqmasdan turib uni o’chirishni iloji yo’q
-- Uning uchun oldin boshqa databasega o’tib olib keyin o’chirish mantiqan to’g’ri bo’ladi.
-- Create => database yaratish ( create database testing_db; )
-- Run ni ishlatish uchun ctrl va enter 2 marta bosib ishlatsa bo’ladi yoki Data Grip o’zidigi run ga bosib ishlatsa bo’ladi


-- 2 - Misol

CREATE TYPE gender_type AS ENUM (
    'male',
    'female',
    'other'
    );

CREATE TABLE IF NOT EXISTS "user"
(
    id          SERIAL PRIMARY KEY,
    username    VARCHAR(100) NOT NULL,
    password    VARCHAR(100) NOT NULL,
    gender_type gender_type DEFAULT 'other'
);

-- 3 - Misol

ALTER TABLE "user"
    ADD COLUMN email VARCHAR(255) NOT NULL DEFAULT 'jalilov@mail.com';

ALTER TABLE "user"
    ADD COLUMN age INT CHECK ( age > 0 );

-- 4 - Misol

ALTER TABLE "user"
    ALTER COLUMN password TYPE TEXT;



-- 5 - Misol

CREATE TYPE todo_type AS ENUM (
    'Personal',
    'Shopping',
    'Optinal'
    );


CREATE TABLE IF NOT EXISTS todo
(
    id        SERIAL PRIMARY KEY,
    todo_name VARCHAR(255) NOT NULL,
    todo_type todo_type DEFAULT 'Optinal',
    user_id   INT REFERENCES "user"
);


INSERT INTO "user"(username, password, gender_type)
VALUES ('Zoirjon', 7777, 'male'),
       ('Sarvar', 9999, 'male'),
       ('Odil', 5555, 'male'),
       ('Sofia', 1111, 'female'),
       ('Maryam', 2222, 'female'),
       ('Fotima', 4444, 'female');


INSERT INTO todo(todo_name, todo_type, user_id)
VALUES ('Swimming', 'Shopping', 1),
       ('Exem', 'Personal', 2),
       ('Sport', 'Personal', 3),
       ('Market', 'Shopping', 1),
       ('Plan weekend trip', 'Shopping', 2),
       ('Read a book', 'Personal', 3),
       ('Homework', 'Personal', 4),
       ('Futboll', 'Shopping', 4);


-- 6,7,8 - Misol


SELECT u.id                                            AS user_id,
       u.username,
       COUNT(t.id)                                     AS todo_count,
       SUM(CASE WHEN t.like = true THEN 1 ELSE 0 END)  AS like_count,
       SUM(CASE WHEN t.like = false THEN 1 ELSE 0 END) AS ilike_count
FROM "user".users u
         INNER JOIN "user".todo t ON u.id = t.user_id
WHERE u.age > 20
  AND u.gender = 'male'
GROUP BY u.id, u.username
ORDER BY CASE WHEN todo_count > 10 THEN 1 ELSE 0 END DESC,
         todo_count DESC;