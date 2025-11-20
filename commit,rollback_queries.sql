-- INDEX

CREATE INDEX idx_email ON Students (Email);

-- I selected an index on Email because 
-- it ensures fast and efficient retrieval of student records during login or email-based searches.

-- 1.Stored Procedure to Update Student Email

DELIMITER //
CREATE PROCEDURE UpdateStudentEmail(
    IN p_Student_ID INT,
    IN p_NewEmail VARCHAR(100)
)
BEGIN
    UPDATE Students
    SET Email = p_NewEmail
    WHERE Student_ID = p_Student_ID;
END;
//
DELIMITER ;

CALL UpdateStudentEmail(1, 'newemail@example.com');

select * from students;


-- 2. Transaction: Insert with SAVEPOINT and ROLLBACK

START TRANSACTION;

INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Phone_Number, Gender, DOB, Class_ID)
VALUES (17, 'Test', 'User', 'testuser@example.com', '9000000000', 'Other', '2001-01-01', 1);

SAVEPOINT sp1;

-- Attempt to insert duplicate email

INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Phone_Number, Gender, DOB, Class_ID)
VALUES (18, 'Test', 'User', 'testuser@example.com', '9000000001', 'Other', '2001-01-02', 1);

-- Rollback to savepoint if duplicate entry

ROLLBACK TO sp1;

COMMIT;

-- 3. JSON Data Storage and Retrieval
CREATE TABLE Student_Metadata (
    Student_ID INT PRIMARY KEY,
    Metadata JSON
);


-- Insert JSON data
INSERT INTO Student_Metadata (Student_ID, Metadata)
VALUES 
(1, '{ "hobbies": ["reading", "coding"], "guardian": { "name": "Raj Rai", "relation": "father" } }'),
(2, '{ "hobbies": ["music", "sports"], "guardian": { "name": "Seema Raj", "relation": "mother" } }');

-- Retrieve JSON data
SELECT 
    Student_ID,
    JSON_UNQUOTE(JSON_EXTRACT(Metadata, '$.guardian.name')) AS Guardian_Name,
    JSON_EXTRACT(Metadata, '$.hobbies') AS Hobbies
FROM Student_Metadata;

select * from Student_Metadata;