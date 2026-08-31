-- Create Students2 table
CREATE TABLE Students2 (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Department_ID INT
);

-- Insert Students
INSERT INTO Students2 VALUES
(101, 'Rahul', 10),
(102, 'Priya', 20),
(103, 'Ravi', 10),
(104, 'Anu', 30),
(105, 'Kiran', NULL);

-- Create Departments table
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

-- Insert Departments
INSERT INTO Departments VALUES
(10, 'CSE'),
(20, 'ECE'),
(30, 'EEE'),
(40, 'MECH');

SELECT Students2.Student_ID, Students2.Student_Name, Departments.Department_Name
FROM Students2
INNER JOIN Departments
ON Students2.Department_ID = Departments.Department_ID;

SELECT 
    Departments.Department_ID,
    Departments.Department_Name,
    Students2.Student_ID,
    Students2.Student_Name
FROM Students2
RIGHT JOIN Departments
ON Students2.Department_ID = Departments.Department_ID;

SELECT 
    Departments.Department_ID,
    Departments.Department_Name,
    Students2.Student_ID,
    Students2.Student_Name
FROM Departments
LEFT JOIN Students2
ON Departments.Department_ID = Students2.Department_ID;


SELECT 
    Students2.Student_ID,
    Students2.Student_Name,
    Departments.Department_ID,
    Departments.Department_Name
FROM Students2
LEFT JOIN Departments
ON Students2.Department_ID = Departments.Department_ID

UNION

SELECT 
    Students2.Student_ID,
    Students2.Student_Name,
    Departments.Department_ID,
    Departments.Department_Name
FROM Students2
RIGHT JOIN Departments
ON Students2.Department_ID = Departments.Department_ID;

-- Create Employees4 table
CREATE TABLE Employees4 (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Manager_ID INT
);

-- Insert records
INSERT INTO Employees4 VALUES
(1, 'Arun', NULL),
(2, 'Ravi', 1),
(3, 'Priya', 1),
(4, 'Kiran', 2);

-- SELF JOIN
SELECT 
    E.Employee_Name AS Employee_Name,
    M.Employee_Name AS Manager_Name
FROM Employees4 E
LEFT JOIN Employees4 M
ON E.Manager_ID = M.Employee_ID;



-- Create Students table
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Department_ID INT
);

-- Create Departments table
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

-- Create Courses table
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Department_ID INT
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    Student_ID INT,
    Course_ID INT,
    PRIMARY KEY (Student_ID, Course_ID)
);

-- Insert Students
INSERT INTO Students VALUES
(101, 'Rahul', 10),
(102, 'Priya', 20),
(103, 'Ravi', 10),
(104, 'Anu', 30),
(105, 'Kiran', 10);

-- Insert Departments
INSERT INTO Departments VALUES
(10, 'CSE'),
(20, 'ECE'),
(30, 'EEE'),
(40, 'MECH');

-- Insert Courses
INSERT INTO Courses VALUES
(201, 'Database Management', 10),
(202, 'Data Structures', 10),
(203, 'Digital Electronics', 20),
(204, 'Power Systems', 30);

-- Insert Enrollments
INSERT INTO Enrollments VALUES
(101, 201),
(101, 202),
(102, 203),
(103, 201),
(104, 204),
(105, 202);

-- Display Student Name, Department Name and Course Name
SELECT
    Students.Student_Name,
    Departments.Department_Name,
    Courses.Course_Name
FROM Students
INNER JOIN Departments
    ON Students.Department_ID = Departments.Department_ID
INNER JOIN Enrollments
    ON Students.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
    ON Enrollments.Course_ID = Courses.Course_ID;

-- Display only CSE students
SELECT
    Students.Student_Name,
    Departments.Department_Name,
    Courses.Course_Name
FROM Students
INNER JOIN Departments
    ON Students.Department_ID = Departments.Department_ID
INNER JOIN Enrollments
    ON Students.Student_ID = Enrollments.Student_ID
INNER JOIN Courses
    ON Enrollments.Course_ID = Courses.Course_ID
WHERE Departments.Department_Name = 'CSE';