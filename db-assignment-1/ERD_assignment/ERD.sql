-- Assignment ERD 

--  schema 
CREATE SCHEMA IF NOT EXISTS BookStore;

-- Authors table
CREATE TABLE IF NOT EXISTS BookStore.Authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

-- Publishers table
CREATE TABLE IF NOT EXISTS BookStore.Publishers (
    publisher_id SERIAL PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- book table
CREATE TABLE IF NOT EXISTS BookStore.Books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL , 
    author VARCHAR(100) NOT NULL, 
    genere VARCHAR(50),
    publisher_id INT, 
    publication_year DATE, 
    FOREIGN KEY(publisher_id) REFERENCES  BookStore.Publishers(publisher_id)
);

-- Customers table
CREATE TABLE  IF NOT EXISTS BookStore.Customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100)
);

-- Orders table
CREATE TABLE IF NOT EXISTS BookStore.Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount DECIMAL,
    FOREIGN KEY(customer_id) REFERENCES BookStore.Customers(customer_id)  
);

-- Book_Authors table (many-to-many)
CREATE TABLE IF NOT EXISTS BookStore.Book_Authors (
    book_id INT, 
    author_id INT,
    PRIMARY KEY(book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES BookStore.Books(book_id),
    FOREIGN KEY (author_id) REFERENCES BookStore.Authors(author_id)
);

-- Order_Items table (many-to-many)
CREATE TABLE IF NOT EXISTS BookStore.Order_Items (
    order_id INT, 
    book_id INT,
    quantity INT,
    PRIMARY KEY(order_id,book_id),
    FOREIGN KEY (order_id) REFERENCES BookStore.Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES BookStore.Books(book_id)
);


