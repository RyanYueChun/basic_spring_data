-- Create the myentity table
CREATE TABLE myentity (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insert sample data into the myentity table
INSERT INTO myentity (name, email, password) VALUES ('Alice', 'alice@example.com', 'password123');
INSERT INTO myentity (name, email, password) VALUES ('Bob', 'bob@example.com', 'password456');
INSERT INTO myentity (name, email, password) VALUES ('Charlie', 'charlie@example.com', 'password789');
