CREATE DATABASE HospitalDB1;
-- Select the existing database
USE HospitalDB1;

-- Create the Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    disease VARCHAR(100)
);



-- Insert 5 records
INSERT INTO Patients VALUES
(1, 'Rahul', 25, 'Fever'),
(2, 'Priya', 30, 'Diabetes'),
(3, 'Amit', 45, 'Asthma'),
(4, 'Sneha', 28, 'Migraine'),
(5, 'Rohit', 35, 'Fever');

-- View table structure
DESCRIBE Patients;

-- Display all records
SELECT * FROM Patients;

SELECT DATABASE();
SHOW DATABASES;

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Joining_Date DATE,
    Email VARCHAR(100)
);