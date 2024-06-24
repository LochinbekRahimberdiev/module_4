CREATE SCHEMA olcha;

CREATE TABLE olcha.users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250),
    email VARCHAR(300),
    password VARCHAR(50)
);
insert into olcha.users( name, email, password)
values ('Lochinbek ','lochinbek43@gmail.com','password'),
       ( 'Umid','umid@gmail.com','ummi12'),
       ('Eldor','eldor@gmail.com','doriyan'),
       ('Ravshan','shermuhammedov@gmail.com','rovshanjon');


CREATE TABLE olcha.category (
    id SERIAL PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    image VARCHAR(150) NOT NULL
);

CREATE TABLE olcha."group" (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    image VARCHAR(150),
    group_id INT REFERENCES olcha.category(id)
);

CREATE TABLE olcha.product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    price FLOAT NOT NULL,
    discount FLOAT DEFAULT 0 NOT NULL,
    group_id INT REFERENCES olcha."group"(id)
);

CREATE TABLE olcha.image (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES olcha.product(id),
    img VARCHAR(100) NOT NULL,
    img1 VARCHAR(100) NOT NULL,
    img2 VARCHAR(100) NOT NULL
);

CREATE TABLE olcha.key_pr (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL
);

CREATE TABLE olcha.value_pr (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL
);

CREATE TABLE olcha.about_pr (
    about_pr_id INT REFERENCES olcha.product(id),
    about_key_id INT REFERENCES olcha.key_pr(id),
    about_value_id INT REFERENCES olcha.value_pr(id)
);

CREATE TABLE olcha.comment (
    id SERIAL PRIMARY KEY,
    name VARCHAR (100),
    email VARCHAR(150),
    text TEXT NOT NULL,
    product_id INT REFERENCES olcha.product(id),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO olcha.category (title, image) VALUES
('Electronics', 'electronics.jpg'),
('Books', 'books.jpg'),
('Clothing', 'clothing.jpg'),
('Home Appliances', 'home_appliances.jpg'),
('Sports Equipment', 'sports_equipment.jpg');
INSERT INTO olcha."group" (title, image, group_id) VALUES
('Smartphones', 'smartphones.jpg', 1),
('Laptops', 'laptops.jpg', 2),
('Fiction', 'fiction.jpg', 3),
('Non-Fiction', 'non_fiction.jpg', 4),
('Male Clothing', 'mens_clothing.jpg', 5);


INSERT INTO olcha.product (name, price, discount, group_id) VALUES
('iPhone 15 Pro Max', 1099.99, 50.00, 1),
('Samsung Galaxy S21 Ultra', 1199.99, 75.00, 1),
('MacBook Pro 16-inch', 2399.99, 200.00, 2),
('Dell XPS 13', 999.99, 100.00, 2),
('Harry Potter Box Set', 59.99, 10.00, 3),
('The Lord of the Rings Trilogy', 45.99, 5.00, 3),
('Becoming by Michelle Obama', 19.99, 2.00, 4),
('Educated by Tara Westover', 18.99, 1.50, 4),
('Levi''s Men''s 501 Original Jeans', 69.99, 10.00, 5),
('Nike Men''s Air Max 270', 150.00, 20.00, 5),
('iPhone 14', 899.99, 40.00, 1),
('Samsung Galaxy Note 20', 999.99, 50.00, 1),
('HP Spectre x360', 1399.99, 150.00, 2),
('Asus ROG Zephyrus G14', 1599.99, 100.00, 2),
('The Hunger Games Trilogy', 40.99, 4.00, 3),
('1984 by George Orwell', 15.99, 2.50, 3),
('Sapiens by Yuval Noah Harari', 22.99, 3.00, 4),
('The Subtle Art of Not Giving a F*ck', 16.99, 1.00, 4),
('Adidas Men''s Ultraboost 21', 180.00, 25.00, 5),
('Under Armour Men''s Charged Assert 8', 75.00, 10.00, 5),
('Google Pixel 6', 699.99, 30.00, 1),
('OnePlus 9 Pro', 969.99, 45.00, 1),
('Microsoft Surface Laptop 4', 1299.99, 100.00, 2),
('Lenovo ThinkPad X1 Carbon', 1449.99, 120.00, 2),
('The Chronicles of Narnia Box Set', 50.99, 5.00, 3),
('To Kill a Mockingbird by Harper Lee', 14.99, 1.50, 3),
('Atomic Habits by James Clear', 21.99, 2.00, 4),
('The Power of Habit by Charles Duhigg', 18.99, 1.50, 4),
('Apple Watch Series 7', 399.99, 25.00, 1),
('Samsung Galaxy Watch 4', 349.99, 20.00, 1),
('Dell Inspiron 15', 649.99, 50.00, 2),
('Acer Aspire 5', 549.99, 40.00, 2),
('Percy Jackson Box Set', 35.99, 3.00, 3),
('The Great Gatsby by F. Scott Fitzgerald', 13.99, 1.00, 3),
('Think and Grow Rich by Napoleon Hill', 17.99, 1.50, 4),
('The Four Agreements by Don Miguel Ruiz', 15.99, 1.00, 4),
('Puma Men''s Tazon 6 FM', 60.00, 8.00, 5),
('Reebok Men''s Classic Harman Run', 70.00, 9.00, 5),
('Sony WH-1000XM4', 299.99, 20.00, 1),
('Bose QuietComfort 35 II', 279.99, 25.00, 1),
('Razer Blade 15', 1799.99, 150.00, 2),
('MSI GS66 Stealth', 1899.99, 160.00, 2),
('A Song of Ice and Fire Box Set', 54.99, 5.00, 3),
('Pride and Prejudice by Jane Austen', 12.99, 1.00, 3),
('How to Win Friends and Influence People', 20.99, 2.00, 4),
('The 7 Habits of Highly Effective People', 18.99, 1.50, 4),
('New Balance Men''s 623 V3', 75.00, 10.00, 5),
('Asics Men''s Gel-Venture 7', 65.00, 8.00, 5),
('Nikon D3500', 499.99, 50.00, 1),
('Canon EOS Rebel T7', 549.99, 55.00, 1),
('HP Envy 13', 1099.99, 90.00, 2),
('LG Gram 14', 1199.99, 95.00, 2),
('The Catcher in the Rye by J.D. Salinger', 14.99, 1.00, 3),
('Moby Dick by Herman Melville', 16.99, 1.50, 3),
('Dare to Lead by Brené Brown', 23.99, 2.50, 4),
('Grit by Angela Duckworth', 21.99, 2.00, 4),
('Nike Men''s Revolution 5', 65.00, 8.00, 5),
('Brooks Men''s Ghost 13', 120.00, 15.00, 5),
('Google Nest Hub', 99.99, 10.00, 1),
('Amazon Echo Show 8', 129.99, 15.00, 1),
('Asus ZenBook 13', 899.99, 70.00, 2),
('Samsung Galaxy Book Flex', 1399.99, 110.00, 2),
('The Hobbit by J.R.R. Tolkien', 10.99, 0.50, 3),
('Fahrenheit 451 by Ray Bradbury', 14.99, 1.00, 3),
('Man''s Search for Meaning by Viktor Frankl', 16.99, 1.50, 4),
('The Road Less Traveled by M. Scott Peck', 15.99, 1.00, 4),
('Adidas Men''s Cloudfoam Ultimate', 85.00, 10.00, 5),
('Saucony Men''s Cohesion 13', 60.00, 7.00, 5),
('Apple AirPods Pro', 249.99, 20.00, 1),
('Samsung Galaxy Buds Pro', 199.99, 15.00, 1),
('Lenovo Yoga C940', 1299.99, 100.00, 2),
('Dell G5 15', 1199.99, 90.00, 2),
('Brave New World by Aldous Huxley', 15.99, 1.00, 3),
('Animal Farm by George Orwell', 13.99, 0.75, 3),
('Mindset by Carol S. Dweck', 18.99, 1.50, 4),
('Daring Greatly by Brené Brown', 19.99, 2.00, 4),
('Merrell Men''s Moab 2 Vent', 100.00, 12.00, 5),
('Columbia Men''s Newton Ridge Plus II', 80.00, 10.00, 5),
('Google Pixel Buds A-Series', 99.99, 10.00, 1),
('Bose SoundSport Free', 199.99, 20.00, 1),
('HP Pavilion 15', 749.99, 60.00, 2),
('Acer Swift 3', 679.99, 55.00, 2),
('The Alchemist by Paulo Coelho', 16.99, 1.00, 3),
('Lord of the Flies by William Golding', 12.99, 0.50, 3),
('The Lean Startup by Eric Ries', 22.99, 2.00, 4),
('Start with Why by Simon Sinek', 20.99, 1.50, 4),
('Skechers Men''s Afterburn', 55.00, 7.00, 5),
('Fila Men''s Memory Workshift', 60.00, 8.00, 5);


-- Insert sample keys
INSERT INTO olcha.key_pr (text) VALUES
('Brand'),
('Model'),
('Color'),
('Storage'),
('Warranty');
-- Insert sample values
INSERT INTO olcha.value_pr (text) VALUES
('Apple'),
('Samsung'),
('Black'),
('White'),
('128GB'),
('256GB'),
('1 Year'),
('2 Years');
DO $$
DECLARE
    prod  RECORD;
    brand_id INT;
    model_id INT;
    color_id INT;
    storage_id INT;
    warranty_id INT;
BEGIN
    -- Assign the IDs for keys (assuming they are 1 to 5 based on insertion order)
    FOR prod IN SELECT id FROM olcha.product LOOP
        -- Brand (randomly assign between Apple and Samsung)
        brand_id := (SELECT id FROM olcha.key_pr WHERE text = 'Brand');
        INSERT INTO olcha.about_pr (about_pr_id, about_key_id, about_value_id)
        VALUES (prod.id, brand_id, (SELECT id FROM olcha.value_pr WHERE text = (CASE WHEN random() < 0.5 THEN 'Apple' ELSE 'Samsung' END)));

        -- Model (randomly assign a model name based on a simple heuristic)
        model_id := (SELECT id FROM olcha.key_pr WHERE text = 'Model');
        INSERT INTO olcha.about_pr (about_pr_id, about_key_id, about_value_id)
        VALUES (prod.id, model_id, (SELECT id FROM olcha.value_pr WHERE text = (CASE WHEN random() < 0.5 THEN 'iPhone 14' ELSE 'Galaxy S21' END)));

        -- Color (randomly assign between Black and White)
        color_id := (SELECT id FROM olcha.key_pr WHERE text = 'Color');
        INSERT INTO olcha.about_pr (about_pr_id, about_key_id, about_value_id)
        VALUES (prod.id, color_id, (SELECT id FROM olcha.value_pr WHERE text = (CASE WHEN random() < 0.5 THEN 'Black' ELSE 'White' END)));

        -- Storage (randomly assign between 128GB and 256GB)
        storage_id := (SELECT id FROM olcha.key_pr WHERE text = 'Storage');
        INSERT INTO olcha.about_pr (about_pr_id, about_key_id, about_value_id)
        VALUES (prod.id, storage_id, (SELECT id FROM olcha.value_pr WHERE text = (CASE WHEN random() < 0.5 THEN '128GB' ELSE '256GB' END)));

        -- Warranty (randomly assign between 1 Year and 2 Years)
        warranty_id := (SELECT id FROM olcha.key_pr WHERE text = 'Warranty');
        INSERT INTO olcha.about_pr (about_pr_id, about_key_id, about_value_id)
        VALUES (prod.id, warranty_id, (SELECT id FROM olcha.value_pr WHERE text = (CASE WHEN random() < 0.5 THEN '1 Year' ELSE '2 Years' END)));
    END LOOP;
END $$;


insert into olcha.comment( name , email,text, product_id)
values (' Jahon', 'jony@gmail.com', ' Chotki narsa ekan . oka dastavka bormi ?',4),
       ('Maraymamat','maray@gmail.com', ' Nimaga juda qimmat bu narsala ?',7),
       ('Gulsanam', 'guly@gmail.com','vay vashshe zor narsa ekanu ',90),
       ('Fozil','foziljon@gmail.com','Juda foydali buyum ekan 😊',13),
       ('Rozigul', 'rozaxon@gmail.com','Puliga arziydimi bu',65),
       ('Niyat','niyatboykemilbayev@gmail.com', 'Bizdin qazagistangayam keledimi?',87),
       ('Hoshimboy','qalpoqcha@gmail.com',' ozbekcha yozsa bolmiydimi?',56);