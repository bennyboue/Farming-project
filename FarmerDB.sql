create database farmerdb;
use farmerdb;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL, 
    display_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    site_role ENUM('farmer', 'consumer') NOT NULL,
    phone_num VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,  -- Available stock
    category VARCHAR(255),  -- e.g., vegetables, fruits
    listed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- For expiry purposes since perishable goods
    FOREIGN KEY (farmer_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- sample data

INSERT INTO Users (username, password_hash, display_name, email, site_role, phone_num) 
VALUES 
('johndoe123', 'password123', 'John Doe', 'johnd@example.com', 'farmer', '0798567285'),
('maryjane456', 'password456', 'Mary Jane', 'maryj@example.com', 'farmer', '0763859127'),
('juliawall789', 'password789', 'Julia Wall', 'juliaw@example.com', 'consumer', '0727591037'),
('alicefox101', 'password101', 'Alice Fox', 'alicef@example.com', 'consumer', '0758296710');

INSERT INTO Products (farmer_id, product_name, product_description, price, quantity, category) 
VALUES 
(1, 'Carrots', 'Fresh organic carrots.', 75.00, 100, 'Vegetables'),
(1, 'Potatoes', 'Locally grown potatoes.', 65.00, 200, 'Vegetables'),
(2, 'Apples', 'Crisp red apples.', 80.00, 150, 'Fruits'),
(2, 'Strawberries', 'Sweet and fresh strawberries.', 40.00, 80, 'Fruits');


-- commands for testing purposes
drop table users,products;
show tables;
select * from products;