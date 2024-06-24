-- Create the University table
CREATE TABLE University (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    rating FLOAT NOT NULL,
    reference  VARCHAR(50) REFERENCES reference_type(name) ON DELETE SET NULL
);
create type reference_type;
-- Insert reference types
INSERT INTO reference_type (name) VALUES ('TUIT'), ('INHA'), ('Webester'),('West Minister'),('TSUE');

-- Create the Student table
CREATE TABLE Student (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    university_id INTEGER REFERENCES University(id) ON DELETE SET NULL
);

-- Insert data into the University table
INSERT INTO University (name, rating, reference) VALUES
    ('University 1', 4.5, 'TUIT'),
    ('University 2', 4.2, 'INHA'),
    ('University 3', 4.8, 'Webester'),
    ('University 4', 4.6, 'West Minister'),
    ('University 5', 4.4, 'TSUE');

-- Insert data into the Student table
INSERT INTO Student (full_name, age, email, gender, university_id) VALUES
    ('John Doe', 20, 'john@example.com', 'Male', 1),
    ('Alice Smith', 20, 'alice@example.com', 'Female', 2),
    ('Bob Johnson', 20, 'bob@example.com', 'Male', 4),
    ('Emily Davis', 20, 'emily@example.com', 'Female', 1),
    ('Michael Brown', 20, 'michael@example.com', 'Male', 5),
    ('Sarah Williams', 20, 'sarah@example.com', 'Female', 3),
    ('David Miller', 20, 'david@example.com', 'Male', 1),
    ('Jessica Taylor', 20, 'jessica@example.com', 'Female', 2),
    ('Matthew Wilson', 20, 'matthew@example.com', 'Male', 3),
    ('Emma Anderson', 20, 'emma@example.com', 'Female', 1),
    ('Daniel Martinez', 20, 'daniel@example.com', 'Male', 5),
    ('Olivia Garcia', 20, 'olivia@example.com', 'Female', 4),
    ('William Hernandez', 20, 'william@example.com', 'Male', 1),
    ('Sophia Lopez', 20, 'sophia@example.com', 'Female', 5),
    ('James Gonzalez', 20, 'james@example.com', 'Male', 3),
    ('Amelia Perez', 20, 'amelia@example.com', 'Female', 4),
    ('Benjamin Torres', 20, 'benjamin@example.com', 'Male', 2),
    ('Chloe Ramirez', 20, 'chloe@example.com', 'Female', 3),
    ('Ethan Cruz', 20, 'ethan@example.com', 'Male', 1);

-- Update university for a student
UPDATE Student SET university_id = 4 WHERE full_name = 'John Doe';

-- Delete a university and set students' university to NULL
DELETE FROM University WHERE id = 3;

-- Update student information
UPDATE Student SET age = 24 WHERE full_name = 'Alice Smith';
