create schema instagram;
set search_path to instagram;

create table "user"
(
    id         serial primary key,
    username   varchar(100) not null unique,
    password   text         not null,
    email      varchar(255),

    created_at timestamptz default current_timestamp,
    updated_at timestamptz default current_timestamp
);


create table post
(
    id         serial primary key,
    title      varchar(100) not null,
    user_id    int references "user" (id),

    created_at timestamptz default current_timestamp,
    updated_at timestamptz default current_timestamp
);

create table comment
(
    id         serial primary key,
    body       text,
    post_id    int references post (id),
    user_id    int references "user" (id),
    created_at timestamptz default current_timestamp
);

create table user_post_like
(
    user_id int references "user" (id),
    post_id int references post (id)

);


create table follower
(
    user_id     int references "user" (id),
    follower_id int references "user" (id),
    primary key (user_id, follower_id),
    check (user_id != follower_id)
);


insert into "user"(username, password)
values ('john', '123'),
       ('jake', 'admin123'),
       ('anna', 'qwerty');

insert into post(title, user_id)
values ('Swimming', 1),
       ('Playing football', 1),
       ('Go to the party', 2),
       ('I am here ', 3),
       ('With my friends', 2);

insert into comment(body, post_id, user_id)
values ('It is amazing', 1, 2),
       ('It is Bad 🤢', 4, 2),
       ('Blahlbalhlablh', 2, 2),
       ('Narxini qancha', 2, 1),
       ('when will we go party ?', 3, 1);


select u.id, u.username, count(p.title)
from comment c
         inner join "user" u on c.user_id = u.id
         inner join post p on p.id = c.post_id
group by u.username, u.id
order by count(p.title);


create schema example;

set search_path to example;

CREATE TABLE top_rated_films
(
    title        VARCHAR NOT NULL,
    release_year SMALLINT
);

CREATE TABLE most_popular_films
(
    title        VARCHAR NOT NULL,
    release_year SMALLINT
);


INSERT INTO top_rated_films(title, release_year)
VALUES ('The Shawshank Redemption', 1994),
       ('The Godfather', 1972),
       ('The Dark Knight', 2008),
       ('12 Angry Men', 1957);

INSERT INTO most_popular_films(title, release_year)
VALUES ('An American Pickle', 2020),
       ('The Godfather', 1972),
       ('The Dark Knight', 2008),
       ('Greyhound', 2020);

alter table top_rated_films
    add column body text default 'asd';

alter table most_popular_films
    add column tana text default 'fasdfasd';

alter table most_popular_films
    drop column tana;
alter table top_rated_films
    drop column body;



select *
from top_rated_films
intersect
select *
from most_popular_films;



CREATE TABLE colors
(
    id     SERIAL PRIMARY KEY,
    bcolor VARCHAR,
    fcolor VARCHAR
);

INSERT INTO colors (bcolor, fcolor)
VALUES ('red', 'red'),
       ('red', 'red'),
       ('red', NULL),
       (NULL, 'red'),
       (NULL, NULL),
       ('green', 'green'),
       ('blue', 'blue'),
       ('blue', 'blue');

SELECT distinct bcolor
FROM colors;

CREATE TABLE sales
(
    brand    VARCHAR NOT NULL,
    segment  VARCHAR NOT NULL,
    quantity INT     NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES ('ABC', 'Premium', 100),
       ('ABC', 'Basic', 200),
       ('XYZ', 'Premium', 100),
       ('XYZ', 'Basic', 300)
RETURNING *;

SELECT segment,

       SUM(quantity)
FROM sales
GROUP BY segment;


SELECT null, null, SUM(quantity)
FROM sales;



SELECT brand,
       segment,
       SUM(quantity)
FROM sales
GROUP BY
    cube (brand, segment)
;

show search_path;

set search_path to instagram;

select *
from "user";

select *
from post
where user_id > (select id
                 from "user"
                 where "user".id = 1);


select *
from post
where user_id in (select id from "user" where username = 'john' or username = 'jake');

select *
from post
where user_id = 1;


create table person
(
    id         serial primary key,
    username   varchar(100) not null unique,
    password   text         not null,
    email      varchar(255),

    created_at timestamptz default current_timestamp,
    updated_at timestamptz default current_timestamp
);

insert into person(username, password, email)
        (select username, password, email from "user" limit 2);


select * from post inner join "user" using(user_id) where "user".username = 'jake';


alter table "user"
rename column id to user_id;


-- category , product

