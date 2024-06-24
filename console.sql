CREATE TABLE IF NOT EXISTS product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    image VARCHAR(60) NOT NULL,
    is_liked BOOLEAN NOT NULL DEFAULT false,
    price FLOAT NOT NULL CHECK (price > 0) DEFAULT 0
);

INSERT INTO product (name, image, is_liked, price)
VALUES ('Popcorn',' jhhfhukhadf',' t', '5000' ),
       (' Coco cola ', ' https.cococola',' t','6000'),
       ('Pepsi','https.pepsi.com', 'f','600'),
       ('Kinder','https.kinder.com', 'y','12000'),
       ( 'Paralament', 'https.tobacco.com','1','2000'),
       ('Qurut','https,tuyaqurut','n','8000');
SELECT * FROM product;
CREATE TABLE new_product as
    SELECT id, name,price from product ;
SELECT *
FROM product
  ORDER BY  name DESC ;

create schema olcha;
create table olcha.employe(
    id serial primary key,
    full_name varchar (100) not null,
    age char (5)
);
INSERT INTO olcha.employe (full_name , age )
values ('Aabdiyev Akmal', ' 34'),
      ('Harry Potter', '13'),
      ('Hermione Grenger','13');

alter table  olcha.employe
      add column  gender varchar (10) not null default 'f',
      add column email varchar (100) not null default '@gmail.com' ;

INSERT INTO OLCHA.EMPLOYE (gender , email)
VALUES ( 'male', ' akmal@gmail.com'),
       ('male','potter@gmail'),
       ('female', 'hermione@gmail.com');