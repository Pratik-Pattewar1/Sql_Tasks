CREATE DATABASE company_db;
USE company_db;
SHOW DATABASEs;

CREATE TABLE employees(
id INT PRIMARY KEY,     
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
age INT UNSIGNED,
salary DECIMAL(10,2) ZEROFILL,
joined DATE
);

INSERT INTO employees (id, name, email, age, salary, joined)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 22, 50000.00, '2026-01-10'),
(2, 'Amit', 'amit@gmail.com', 24, 65000.00, '2026-02-15'),
(3, 'Priya', 'priya@gmail.com', 23, 55000.00, '2026-03-20');

SELECT * FROM employees;

CREATE TABLE emp_dept (
    emp_name VARCHAR(50),
    dept_id INT
);
INSERT INTO emp_dept (emp_name, dept_id)
VALUES
('Rahul', 101),
('Amit', 102),
('Priya', 101);

CREATE TABLE departments (
    dept_name VARCHAR(50),
    dept_id INT
);

INSERT INTO departments (dept_name, dept_id)
VALUES
('IT', 101),
('HR', 102),
('Finance', 103);

-- 1)Inner Join
SELECT emp_dept.emp_name, departments.dept_name, emp_dept.dept_id
FROM emp_dept
INNER JOIN departments
ON emp_dept.dept_id = departments.dept_id;

-- 1)Right Join
SELECT emp_dept.emp_name, departments.dept_name, emp_dept.dept_id
FROM emp_dept
RIGHT JOIN departments
ON emp_dept.dept_id = departments.dept_id;

-- 3)Left Join
SELECT emp_dept.emp_name, departments.dept_name, emp_dept.dept_id
FROM emp_dept
LEFT JOIN departments
ON emp_dept.dept_id = departments.dept_id;

-- 4)Full Outer Join
SELECT emp_dept.emp_name, departments.dept_name, emp_dept.dept_id
FROM emp_dept
LEFT JOIN departments
ON emp_dept.dept_id = departments.dept_id

UNION

SELECT emp_dept.emp_name, departments.dept_name, departments.dept_id
FROM emp_dept
RIGHT JOIN departments
ON emp_dept.dept_id = departments.dept_id;

-- 5)Cross Join
SELECT emp_dept.emp_name, departments.dept_name
FROM emp_dept
CROSS JOIN departments;

-- Table creation

CREATE TABLE Employee_Salary (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Dept VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee_Salary (EmpID, EmpName, Dept, Salary)
VALUES
(1, 'Rahul', 'IT', 50000.00),
(2, 'Amit', 'HR', 45000.00),
(3, 'Priya', 'IT', 55000.00),
(4, 'Neha', 'Finance', 60000.00),
(5, 'Rohit', 'HR', 48000.00);

SELECT * FROM Employee_Salary;

SELECT Dept, COUNT(*) AS Employee_Count
FROM Employee_Salary
GROUP BY Dept;

SELECT Dept, COUNT(EmpID)
FROM Employee_Salary
WHERE Salary > 50000
GROUP BY Dept;

SELECT Dept, SUM(Salary) AS Total_Salary
FROM Employee_Salary
GROUP BY Dept;

SELECT Dept, AVG(Salary) AS Avg_Salary
FROM Employee_Salary
GROUP BY Dept;

SELECT Dept,
MAX(Salary) AS Max_Salary,
Min(Salary) AS Min_Salary
FROM Employee_Salary
GROUP BY Dept;

CREATE TABLE employees1 (
    employee_id INT PRIMARY KEY,
    dept_id INT,
    hire_date DATE,
    salary DECIMAL(10,2)
);
INSERT INTO employees1 (employee_id, dept_id, hire_date, salary)
VALUES
(1, 101, '2019-05-10', 55000),
(2, 101, '2021-03-15', 65000),
(3, 101, '2022-07-20', 70000),
(4, 102, '2021-01-10', 75000),
(5, 102, '2022-06-12', 80000),
(6, 102, '2023-02-25', 85000),
(7, 103, '2018-11-05', 50000),
(8, 103, '2021-08-18', 55000),
(9, 104, '2022-04-22', 90000),
(10, 104, '2023-09-01', 95000);

SELECT dept_id, AVG(salary) AS avg_salary	
FROM employees1
WHERE hire_date > '2020-01-01'
GROUP BY dept_id
HAVING AVG(salary) > 60000;

-- Create Database
CREATE DATABASE sales_db;
USE sales_db;

-- Create Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Insert Categories
INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');


-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert Products
INSERT INTO products VALUES
(101, 'Laptop', 1),
(102, 'Mobile Phone', 1),
(103, 'T-Shirt', 2),
(104, 'Jeans', 2),
(105, 'SQL Book', 3),
(106, 'Python Book', 3);


-- Create Order Details Table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Order Details
INSERT INTO order_details VALUES
(1, 101, 2, 50000),
(2, 102, 3, 20000),
(3, 103, 5, 1000),
(4, 104, 2, 2500),
(5, 105, 4, 800),
(6, 106, 3, 1200);


-- Check Tables
SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM order_details;


-- JOIN + GROUP BY + SUM
SELECT 
    categories.category_name,
    SUM(order_details.quantity * order_details.price) AS total_sales
FROM categories
INNER JOIN products
    ON categories.category_id = products.category_id
INNER JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY 
    categories.category_id,
    categories.category_name
ORDER BY total_sales DESC;


-- task - 1
-- 1. Create Database
CREATE DATABASE CollegeDB;

-- 2. Select Database
USE CollegeDB;

-- 3. Create Students Table
CREATE TABLE Students1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);

-- 4. Insert 5 Student Records
INSERT INTO Students (student_id, student_name, age, course, marks)
VALUES
(1, 'Rahul', 20, 'Computer Science', 85),
(2, 'Priya', 21, 'Information Technology', 90),
(3, 'Amit', 20, 'Electronics', 78),
(4, 'Sneha', 22, 'Computer Science', 92),
(5, 'Rohit', 21, 'Mechanical', 75);

-- 5. Display All Student Records
SELECT * FROM Students;

-- task 2
-- Create Database
CREATE DATABASE LibraryDB;

-- Select Database
USE LibraryDB;


-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    publication_year INT
);


-- Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);


-- Create Borrowing Table
CREATE TABLE Borrowing (
    borrowing_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,

    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


-- Insert Books
INSERT INTO Books VALUES
(101, 'The Alchemist', 'Paulo Coelho', 'Fiction', 1988),
(102, 'Clean Code', 'Robert Martin', 'Programming', 2008),
(103, 'Atomic Habits', 'James Clear', 'Self Help', 2018),
(104, 'Harry Potter', 'J.K. Rowling', 'Fantasy', 1997),
(105, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937);


-- Insert Members
INSERT INTO Members VALUES
(1, 'Rahul', 'rahul@gmail.com', '9876543210'),
(2, 'Priya', 'priya@gmail.com', '9876543211'),
(3, 'Amit', 'amit@gmail.com', '9876543212'),
(4, 'Sneha', 'sneha@gmail.com', '9876543213'),
(5, 'Rohit', 'rohit@gmail.com', '9876543214');


-- Insert Borrowing Records
INSERT INTO Borrowing VALUES
(1, 1, 101, '2026-08-01', '2026-08-10'),
(2, 2, 102, '2026-08-05', '2026-08-15'),
(3, 3, 103, '2026-08-10', NULL),
(4, 4, 104, '2026-08-12', '2026-08-20'),
(5, 5, 105, '2026-08-15', NULL);


-- Display All Records
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrowing;

-- Task - 3
-- 1. Create the database
CREATE DATABASE HospitalDB;

-- 2. Select the database
USE HospitalDB;

-- 3. Create one table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    disease VARCHAR(100),
    doctor_name VARCHAR(50)
);

-- 4. Insert 5 records
INSERT INTO Patients (patient_id, patient_name, age, disease, doctor_name)
VALUES
(1, 'Rahul', 25, 'Fever', 'Dr. Sharma'),
(2, 'Priya', 30, 'Diabetes', 'Dr. Patel'),
(3, 'Amit', 45, 'Blood Pressure', 'Dr. Khan'),
(4, 'Sneha', 28, 'Migraine', 'Dr. Mehta'),
(5, 'Rohit', 35, 'Asthma', 'Dr. Singh');

-- 5. Display all records
SELECT * FROM Patients;