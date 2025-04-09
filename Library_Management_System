-- --------------------------------------------
-- Library Management System Database
-- --------------------------------------------
 --creating database
   CREATE DATABASE Library_Management;
   
-- 1. Authors Table
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT
);

-- 2. Books Table
CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title TEXT,
    AuthorID INTEGER,
    Publisher TEXT,
    ISBN TEXT,
    Genre TEXT,
    YearPublished INTEGER,
    TotalCopies INTEGER,
    AvailableCopies INTEGER,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- 3. Members Table
CREATE TABLE Members (
    MemberID INTEGER PRIMARY KEY,
    FullName TEXT,
    Email TEXT,
    Phone TEXT,
    Address TEXT,
    MembershipDate DATE
);

-- 4. Borrowing Table
CREATE TABLE Borrowing (
    BorrowID INTEGER PRIMARY KEY,
    MemberID INTEGER,
    BookID INTEGER,
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 5. Librarians Table
CREATE TABLE Librarians (
    LibrarianID INTEGER PRIMARY KEY,
    FullName TEXT,
    Email TEXT,
    Phone TEXT
);

-- --------------------------------------------
-- Sample Data Insertion
-- --------------------------------------------

-- Authors
INSERT INTO Authors (AuthorID, FirstName, LastName) VALUES
(1, 'James', 'Clear'),
(2, 'Héctor', 'García'),
(3, 'Morgan', 'Housel'),
(4, 'Paulo', 'Coelho'),
(5, 'Yuval Noah', 'Harari');

-- Books
INSERT INTO Books (BookID, Title, AuthorID, Publisher, ISBN, Genre, YearPublished, TotalCopies, AvailableCopies) VALUES
(1, 'Atomic Habits', 1, 'Avery', '9780735211292', 'Self-help', 2018, 8, 8),
(2, 'Ikigai', 2, 'Penguin Books', '9780143130727', 'Wellness', 2017, 10, 10),
(3, 'The Psychology of Money', 3, 'Harriman House', '9780857197689', 'Finance', 2020, 6, 6),
(4, 'The Alchemist', 4, 'HarperOne', '9780061122415', 'Fiction', 1988, 12, 12),
(5, 'Sapiens', 5, 'Harvill Secker', '9780099590088', 'History', 2011, 5, 5);

-- Members
INSERT INTO Members (MemberID, FullName, Email, Phone, Address, MembershipDate) VALUES
(1, 'Aanya Desai', 'aanya.d@genzmail.com', '9876543201', 'Ahmedabad, India', '2025-01-05'),
(2, 'Rohan Mehra', 'rohan.m@educonnect.com', '9876543202', 'Chennai, India', '2025-02-10'),
(3, 'Meera Shah', 'meera.s@readershub.com', '9876543203', 'Lucknow, India', '2025-03-01'),
(4, 'Yash Thakur', 'yash.t@zenith.com', '9876543204', 'Indore, India', '2025-03-12'),
(5, 'Tara Kapoor', 'tara.k@schoolhub.com', '9876543205', 'Jaipur, India', '2025-04-01');

-- Librarians
INSERT INTO Librarians (LibrarianID, FullName, Email, Phone) VALUES
(1, 'Neha Verma', 'neha.v@libraryhub.com', '9087654321'),
(2, 'Rahul Desai', 'rahul.d@libraryhub.com', '9012345678'),
(3, 'Sneha Rao', 'sneha.r@libraryhub.com', '9098765432'),
(4, 'Arjun Patel', 'arjun.p@libraryhub.com', '9123456780'),
(5, 'Mehul Joshi', 'mehul.j@libraryhub.com', '9134567890');

-- Borrowing Records (with different borrow frequency)
INSERT INTO Borrowing (BorrowID, MemberID, BookID, BorrowDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2025-03-28', '2025-04-11', NULL),
(2, 2, 2, '2025-03-29', '2025-04-12', NULL),
(3, 3, 3, '2025-03-30', '2025-04-13', NULL),
(4, 4, 4, '2025-04-01', '2025-04-15', NULL),
(5, 5, 5, '2025-04-02', '2025-04-16', NULL),
(6, 2, 1, '2025-04-03', '2025-04-17', NULL),
(7, 3, 1, '2025-04-04', '2025-04-18', NULL),
(8, 4, 1, '2025-04-05', '2025-04-19', NULL),
(9, 5, 1, '2025-04-06', '2025-04-20', NULL),
(10, 1, 2, '2025-04-04', '2025-04-18', NULL),
(11, 3, 2, '2025-04-06', '2025-04-20', NULL),
(12, 2, 4, '2025-04-06', '2025-04-20', NULL),
(13, 1, 5, '2025-04-06', '2025-04-20', NULL),
(14, 4, 5, '2025-04-07', '2025-04-21', NULL),
(15, 2, 5, '2025-04-08', '2025-04-22', NULL);

-- --------------------------------------------
-- Simple Queries
-- --------------------------------------------

-- Books with authors
SELECT Books.Title, Authors.FirstName || ' ' || Authors.LastName AS Author
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- Members and borrowed books
SELECT Members.FullName, Books.Title
FROM Borrowing
JOIN Members ON Borrowing.MemberID = Members.MemberID
JOIN Books ON Borrowing.BookID = Books.BookID;

-- Overdue books
SELECT Members.FullName, Books.Title, Borrowing.DueDate
FROM Borrowing
JOIN Members ON Borrowing.MemberID = Members.MemberID
JOIN Books ON Borrowing.BookID = Books.BookID
WHERE Borrowing.ReturnDate IS NULL AND Borrowing.DueDate < DATE('now');

-- Available books
SELECT Title FROM Books WHERE AvailableCopies > 0;

-- Popular books (borrow count)
SELECT Books.Title, COUNT(Borrowing.BorrowID) AS TimesBorrowed
FROM Books
LEFT JOIN Borrowing ON Books.BookID = Borrowing.BookID
GROUP BY Books.Title
ORDER BY TimesBorrowed DESC;

-- All librarians
SELECT FullName, Email FROM Librarians;
