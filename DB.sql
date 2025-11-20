
CREATE DATABASE student_data;

USE student_data;

-- Create Classes Table
CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY,
    Class_Name VARCHAR(100) NOT NULL,
    Academic_Year VARCHAR(50) NOT NULL
);

-- Create Students Table
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY NOT NULL,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone_Number VARCHAR(15),
    Gender VARCHAR(10),
    DOB DATE,
    Class_ID INT,
    FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

-- Create Teachers Table
CREATE TABLE Teachers (
    Teacher_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Department VARCHAR(100)
);

-- Create Courses Table
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Teacher_ID INT,
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID)
);

-- Create Attendance Table
CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Date DATE NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('present', 'absent')),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Create Performance Table
CREATE TABLE Performance (
    Grade_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Marks_Obtained DECIMAL(5,2),
    Exam_Type VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Insert into Classes
INSERT INTO Classes (Class_ID, Class_Name, Academic_Year)
VALUES 
(1, 'Computer Science', '2024-2025'),
(2, 'Data Science', '2024-2025');

-- Insert into Teachers
INSERT INTO Teachers (Teacher_ID, Name, Email, Department)
VALUES 
(5, 'mr. dinesh', 'dinesh@example.com', 'Computer Science'),
(6, 'mrs. raji', 'rajii@example.com', 'Mathematics'),
(7, 'mr. amit', 'amit@example.com', 'Cybersecurity'),
(8, 'mrs. kavita', 'kavita@example.com', 'Marketing'),
(9, 'mr. arjun', 'arjun@example.com', 'AI & ML');

-- Insert into Courses
INSERT INTO Courses (Course_ID, Course_Name, Teacher_ID)
VALUES 
(103, 'Python Programming', 5), 
(104, 'Statistics', 6),
(105, 'Data Science', 5),
(106, 'Fullstack', 7),
(107, 'Cybersecurity', 7),
(108, 'Digital Marketing', 8),
(109, 'Artificial Intelligence', 9);

-- Insert into Students
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Phone_Number, Gender, DOB, Class_ID)
VALUES 
(1, 'Riya', 'Rai', 'riya@example.com', '9999999991', 'Female', '2000-01-15', 1),
(2, 'Rishi', 'Raj', 'rishi@example.com', '9999999992', 'Male', '1999-05-10', 1),
(3, 'Samiksha', 'Joshi', 'samiksha@example.com', '9999999993', 'Female', '2001-03-25', 1),
(4, 'Ankit', 'Tamang', 'ankit@example.com', '9999999994', 'Male', '2000-07-18', 1),
(5, 'Richa', 'Rai', 'richa@example.com', '9999999995', 'Female', '2000-09-12', 1),
(6, 'Anup', 'Thulung', 'anup@example.com', '9999999996', 'Male', '1998-11-30', 1),
(7, 'Nikhil', 'Sharma', 'nikhil@example.com', '9999999997', 'Male', '1999-08-15', 2),
(8, 'Priya', 'Verma', 'priya@example.com', '9999999998', 'Female', '2000-12-01', 2),
(9, 'Raman', 'Kumar', 'raman@example.com', '9999999999', 'Male', '2001-04-22', 2),
(10, 'Sneha', 'Singh', 'sneha@example.com', '9999999980', 'Female', '1998-06-18', 2),
(11, 'Amit', 'Patel', 'amit@example.com', '9999999981', 'Male', '1997-09-30', 1),
(12, 'Neha', 'Reddy', 'neha@example.com', '9999999982', 'Female', '1999-01-20', 1),
(13, 'Vikas', 'Thakur', 'vikas@example.com', '9999999983', 'Male', '2000-10-10', 1),
(14, 'Pooja', 'Kale', 'pooja@example.com', '9999999984', 'Female', '2001-07-07', 1),
(15, 'Ravi', 'Mehra', 'ravi@example.com', '9999999985', 'Male', '2002-03-03', 2),
(16, 'Divya', 'Kapoor', 'divya@example.com', '9999999986', 'Female', '1998-05-25', 2);

-- Insert into Attendance
INSERT INTO Attendance (Attendance_ID, Student_ID, Course_ID, Date, Status)
VALUES  
(1, 1, 103, '2025-06-01', 'Present'),
(2, 2, 104, '2025-06-01', 'Absent'),
(3, 3, 103, '2025-06-01', 'Present'),
(4, 4, 103, '2025-06-01', 'Present'),
(5, 5, 104, '2025-06-01', 'Absent'),
(6, 6, 104, '2025-06-01', 'Present'),
(7, 7, 105, '2025-06-01', 'Present'),
(8, 8, 106, '2025-06-01', 'Absent'),
(9, 9, 107, '2025-06-01', 'Present'),
(10, 10, 108, '2025-06-01', 'Absent'),
(11, 11, 109, '2025-06-01', 'Present'),
(12, 12, 106, '2025-06-01', 'Present'),
(13, 13, 105, '2025-06-01', 'Present'),
(14, 14, 108, '2025-06-01', 'Present'),
(15, 15, 107, '2025-06-01', 'Absent'),
(16, 16, 109, '2025-06-01', 'Present');

-- Insert into Performance
INSERT INTO Performance (Grade_ID, Student_ID, Course_ID, Marks_Obtained, Exam_Type, Date)
VALUES 
(1, 1, 103, 88.50, 'Midterm', '2025-06-15'),
(2, 2, 103, 72.00, 'Midterm', '2025-06-15'),
(3, 3, 103, 91.25, 'Midterm', '2025-06-15'),
(4, 4, 104, 85.00, 'Midterm', '2025-06-15'),
(5, 5, 104, 79.50, 'Midterm', '2025-06-15'),
(6, 6, 104, 90.00, 'Midterm', '2025-06-15'),
(7, 7, 105, 80.00, 'Midterm', '2025-06-15'),
(8, 8, 106, 75.00, 'Midterm', '2025-06-15'),
(9, 9, 107, 89.00, 'Midterm', '2025-06-15'),
(10, 10, 108, 92.50, 'Midterm', '2025-06-15'),
(11, 11, 109, 84.75, 'Midterm', '2025-06-15'),
(12, 12, 106, 88.00, 'Midterm', '2025-06-15'),
(13, 13, 105, 91.50, 'Midterm', '2025-06-15'),
(14, 14, 108, 87.00, 'Midterm', '2025-06-15'),
(15, 15, 107, 73.25, 'Midterm', '2025-06-15'),
(16, 16, 109, 95.00, 'Midterm', '2025-06-15');
