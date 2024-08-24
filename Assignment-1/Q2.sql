-- Create the Author table
CREATE TABLE Author (
    AuthorID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Nationality VARCHAR(100),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Book table
CREATE TABLE Book (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255),
    ISBN VARCHAR(13) UNIQUE,
    Genre VARCHAR(100),
    Price DECIMAL(10, 2),
    PublishedDate DATE,
    AuthorID INT REFERENCES Author(AuthorID),
    StockQuantity INT,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the CustomerOrder table
CREATE TABLE CustomerOrder (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(20),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into Author
INSERT INTO Author (FirstName, LastName, DateOfBirth, Nationality)
VALUES ('George', 'Orwell', '1903-06-25', 'British'),
       ('J.K.', 'Rowling', '1965-07-31', 'British');

-- Insert sample data into Book
INSERT INTO Book (Title, ISBN, Genre, Price, PublishedDate, AuthorID, StockQuantity)
VALUES ('1984', '9780451524935', 'Dystopian', 9.99, '1949-06-08', 1, 50),
       ('Harry Potter and the Philosopher''s Stone', '9780747532743', 'Fantasy', 7.99, '1997-06-26', 2, 100);

-- Insert sample data into Customer
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address)
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Maple Street, Anytown, USA'),
       ('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue, Anytown, USA');

-- Insert sample data into CustomerOrder
INSERT INTO CustomerOrder (CustomerID, OrderDate, TotalAmount, OrderStatus)
VALUES (1, '2024-08-21', 17.98, 'Shipped'),
       (2, '2024-08-22', 7.99, 'Pending');
       
       
-- View all authors
SELECT * FROM Author;

-- View all books
SELECT * FROM Book;

-- View all customers
SELECT * FROM Customer;

-- View all customer orders
SELECT * FROM CustomerOrder;

