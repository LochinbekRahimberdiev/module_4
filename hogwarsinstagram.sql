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
values ('Harry', 'harry12'),
       ('Ronald', 'rony'),
       ('Hermione', 'qwerty');

insert into post(title, user_id)
values ('Flying on brush', 1),
       ('Playing football', 1),
       ('Go to the dangerous forest', 2),
       ('I am here ', 3),
       ('With students at Hogwars', 2);

insert into comment(body, post_id, user_id)
values ('It is amazing', 1, 2),
       ('Welldone', 4, 2),
       (' hi body . whats up, 2, 2),
       ('oh my god', 2, 1),
       ('when will we go Hogwars ?', 3, 1);


select  u.id,u.username, count(p.title)
    from comment c
         inner join "user" u on c.user_id = u.id
            inner join post p on p.id = c.post_id
                group by u.username,u.id order by count(p.title);

