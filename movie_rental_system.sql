-- Create Database

CREATE DATABASE movie_rental; USE movie_rental;

-- Create Tables

CREATE TABLE Customers ( customer_id INT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100), phone VARCHAR(15), address TEXT );

CREATE TABLE Movies ( movie_id INT PRIMARY KEY, title VARCHAR(100), genre VARCHAR(50), release_year INT, rating VARCHAR(10), copies_available INT );

CREATE TABLE Rentals (

rental_id INT PRIMARY KEY, customer_id INT, movie_id INT, rental_date DATE, return_date DATE, status VARCHAR(20), FOREIGN KEY (customer_id) REFERENCES Customers (customer_id), FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) );

CREATE TABLE Payments ( payment_id INT PRIMARY KEY, rental_id INT, amount DECIMAL(8,2), payment_date DATE, payment_method VARCHAR(50), FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id) );

-- Insert Data

-- Customers

INSERT INTO Customers (customer_id, name, email, phone, address) VALUES

(1, 'Rahul Sharma', 'rahul@example.com', '9876543210', 'Mumbai, India'),

(2, 'Ananya Verma', 'ananya@example.com', '9123456780', 'Delhi, India'),

(3, 'Karan Mehta', 'karan@example.com', '9998887776', 'Hyderabad, India'),

(4, 'Sita Reddy', 'sita@example.com', '9988776655', 'Chennai, India'),

(5, 'Ravi Teja', 'ravi@example.com', '9871234567', 'Bangalore, India'),

(6, 'Meera Nair', 'meera@example.com', '9665544332', 'Kochi, India'),

(7, 'Arjun Desai', 'arjun@example.com', '9543216789', 'Ahmedabad, India'),

(8, 'Priya Kapoor', 'priya@example.com', '9345678912', 'Jaipur, India'),

(9, 'Dev Raj', 'dev@example.com', '9654321987', 'Pune, India'),

(10, 'Neha Sinha', 'neha@example.com', '9874563210', 'Lucknow, India');

-- Movies

INSERT INTO Movies (movie_id, title, genre, release_year, rating, copies_available) VALUES

(101, 'The Lion King', 'Animation', 1994, 'G', 5),

(102, 'Finding Nemo', 'Animation', 2003, 'G', 4),

(103, 'Toy Story', 'Animation', 1995, 'G', 3),

(104, 'Paddington 2', 'Comedy', 2017, 'PG', 4),

(105, 'The Incredibles', 'Action', 2004, 'PG', 2),

(106, 'Frozen', 'Animation', 2013, 'PG', 6),

(107, 'Coco', 'Animation', 2017, 'PG', 5),

(108, 'Zootopia', 'Adventure', 2016, 'PG', 4),

(109, 'Up', 'Adventure', 2009, 'PG', 3),

(110, 'Moana', 'Adventure', 2016, 'PG', 4);

- Sample Queries

Select all customers

SELECT * FROM Customers;

Get movies with more than 4 copies available

SELECT title, copies_available FROM Movies WHERE copies_available > 4;

Get all rentals for a specific customer (Customer ID = 1)

SELECT Rentals.rental_id, Movies.title, Rentals.rental_date, Rentals.return_date

FROM Rentals

JOIN Movies ON Rentals.movie_id = Movies.movie_id

WHERE Rentals.customer_id = 1;

Get all rentals that have not been returned yet

SELECT rental_id, customer_id, movie_id, rental_date

FROM Rentals

WHERE return_date IS NULL;

Get total payment for a specific rental (Rental ID = 201)

SELECT SUM(amount) AS total_payment

FROM Payments

WHERE rental_id = 201;

Get rental details for movies released after 2010

SELECT Rentals.rental_id, Movies.title, Rentals.rental_date

FROM Rentals

JOIN Movies ON Rentals.movie_id = Movies.movie_id

WHERE Movies.release_year > 2010;
