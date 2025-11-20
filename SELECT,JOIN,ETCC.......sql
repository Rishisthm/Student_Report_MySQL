USE STUDENT_DATA;

SELECT * FROM STUDENTS;

-- Students who were absent on '2025-06-01'

SELECT s.First_Name, s.Last_Name, s.Email
FROM Students s
JOIN Attendance a ON s.Student_ID = a.Student_ID
WHERE a.Status = 'Absent' AND a.Date = '2025-06-01';

-- Students scoring above average in their course's Midterm

SELECT s.First_Name, s.Last_Name, p.Marks_Obtained, p.Course_ID
FROM Performance p
JOIN Students s ON s.Student_ID = p.Student_ID
WHERE  p.Marks_Obtained > (
 SELECT AVG(Marks_Obtained)
 FROM Performance
 WHERE Course_ID = p.Course_ID);
 
 
 -- Students whose birthday falls in current month
 
SELECT First_Name, Last_Name, DOB
FROM Students
WHERE MONTH(DOB) = MONTH(CURRENT_DATE());

-- JOINs and Multi-table Queries:


-- Student name, class, teacher name

SELECT S.FIRST_NAME, S.LAST_NAME,C.CLASS_NAME,T.`NAME` 
FROM STUDENTS S 
INNER JOIN CLASSES C ON C.class_ID = S.class_ID
JOIN Performance p ON S.Student_ID = p.Student_ID
JOIN Courses co ON p.Course_ID = co.Course_ID
JOIN Teachers t ON co.Teacher_ID = t.Teacher_ID;

-- Student attendance details with course

SELECT S.STUDENT_ID,S.FIRST_NAME,S.LAST_NAME,C.COURSE_NAME,A.`STATUS` 
FROM STUDENTS S 
INNER JOIN ATTENDANCE A ON S.STUDENT_ID = A.STUDENT_ID
INNER JOIN COURSES C ON A.COURSE_ID = C.COURSE_ID;

-- Subqueries

-- Students scoring above global average

SELECT s.First_Name, s.Last_Name, p.Marks_Obtained
FROM Performance p
JOIN Students s ON s.Student_ID = p.Student_ID
WHERE p.Marks_Obtained > (SELECT AVG(Marks_Obtained) FROM Performance);

-- Aggregations and Grouping
-- Average marks per course

SELECT c.Course_Name, AVG(p.Marks_Obtained) AS Avg_Marks, COUNT(*) AS Student_Count
FROM Performance p
JOIN Courses c ON p.Course_ID = c.Course_ID
GROUP BY c.Course_Name;

-- Student count by class

SELECT c.Class_Name, COUNT(s.Student_ID) AS Total_Students
FROM Classes c
LEFT JOIN Students s ON c.Class_ID = s.Class_ID
GROUP BY c.Class_Name
ORDER BY Total_Students DESC;



