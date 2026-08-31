-- Create database
CREATE DATABASE CollegeManagement;

-- Select database
USE CollegeManagement;

-- Create Students table
CREATE TABLE Students (
    Student_ID INT UNSIGNED PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Age INT UNSIGNED NOT NULL,
    Department VARCHAR(50) NOT NULL,
    `Year` INT UNSIGNED NOT NULL,
    CGPA DECIMAL(3,2) UNSIGNED NOT NULL
);

-- Insert 10 students
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, `Year`, CGPA)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 20, 'CSE', 2, 8.50),
(2, 'Priya Patel', 'priya@gmail.com', '9876543211', 21, 'ECE', 3, 9.10),
(3, 'Amit Kumar', 'amit@gmail.com', '9876543212', 20, 'CSE', 2, 7.80),
(4, 'Sneha Verma', 'sneha@gmail.com', '9876543213', 22, 'IT', 4, 8.90),
(5, 'Rohit Singh', 'rohit@gmail.com', '9876543214', 21, 'CSE', 3, 9.20),
(6, 'Anjali Gupta', 'anjali@gmail.com', '9876543215', 19, 'MECH', 1, 7.50),
(7, 'Vikas Reddy', 'vikas@gmail.com', '9876543216', 22, 'CSE', 4, 8.70),
(8, 'Neha Joshi', 'neha@gmail.com', '9876543217', 20, 'CIVIL', 2, 8.10),
(9, 'Arjun Mehta', 'arjun@gmail.com', '9876543218', 23, 'IT', 4, 7.90),
(10, 'Pooja Shah', 'pooja@gmail.com', '9876543219', 21, 'CSE', 3, 8.80);

-- Display all students
SELECT * FROM Students;

-- Display CSE students
SELECT * FROM Students
WHERE Department = 'CSE';

-- Display students with CGPA greater than 8
SELECT * FROM Students
WHERE CGPA > 8;

-- Display students whose age is above 20
SELECT * FROM Students
WHERE Age > 20;

-- Try duplicate Student_ID
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, `Year`, CGPA)
VALUES
(1, 'Test Student', 'test@gmail.com', '9876543220', 20, 'CSE', 2, 8.00);

-- Try duplicate Email
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, `Year`, CGPA)
VALUES
(11, 'Test Student', 'rahul@gmail.com', '9876543220', 20, 'CSE', 2, 8.00);

-- Try NULL student name
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, `Year`, CGPA)
VALUES
(11, NULL, 'test@gmail.com', '9876543220', 20, 'CSE', 2, 8.00);

-- Try negative age
INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, `Year`, CGPA)
VALUES
(11, 'Test Student', 'test@gmail.com', '9876543220', -5, 'CSE', 2, 8.00);

-- Add Address column
ALTER TABLE Students
ADD Address VARCHAR(200);

-- Describe table
DESCRIBE Students;