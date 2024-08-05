
IF OBJECT_ID('Students_Info', 'U') IS NOT NULL
    DROP TABLE Students_Info;
GO


CREATE TABLE Students_Info (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName VARCHAR(100),
    BirthDate DATE,
    Gender VARCHAR(10), 
    EnrollmentDate DATE,
    Email VARCHAR(100),
    GradeLevel INT,
    Track VARCHAR(20),
    GPA DECIMAL(5,2) -- Adjusted GPA column
);
GO


INSERT INTO Students_Info (StudentName, BirthDate, Gender, EnrollmentDate, Email, GradeLevel, Track, GPA)
VALUES 
('Ahmed Ali', '2006-02-10', 'M', '2022-08-30', 'ahmed.ali@example.com', 1, 'Elmi', 92),
('Sarah Mohamed', '2005-05-22', 'F', '2021-08-30', 'sarah.mohamed@example.com', 6, 'Insani', 99),
('Yousef Abdullah', '2007-07-18', 'M', '2022-08-30', 'yousef.abdullah@example.com', 2, 'Elmi', 85),
('Layla Hassan', '2004-11-05', 'F', '2020-08-30', 'layla.hassan@example.com', 6, 'Insani', 100),
('Khaled Ahmed', '2008-01-15', 'M', '2023-08-30', 'khaled.ahmed@example.com', 1, 'Elmi', 78),
('Noor Abdulaziz', '2006-09-23', 'F', '2022-08-30', 'noor.abdulaziz@example.com', 2, 'Elmi', 89),
('Fatimah Saeed', '2005-03-10', 'F', '2021-08-30', 'fatimah.saeed@example.com', 6, 'Insani', 100),
('Omar Ibrahim', '2007-12-30', 'M', '2022-08-30', 'omar.ibrahim@example.com', 1, 'Elmi', 60),
('Reem Khalid', '2004-08-12', 'F', '2020-08-30', 'reem.khalid@example.com', 6, 'Insani', 55),
('Ziad ', '2008-06-01', 'M', '2023-08-30', 'ziad.ali@example.com', 4, 'Elmi', 100),
('Ahmed Asim', '2006-02-20', 'M', '2022-08-30', 'ahmed.Asim@example.com', 1, 'Elmi', 100);
GO


IF OBJECT_ID('Honored_Students', 'U') IS NOT NULL
    DROP TABLE Honored_Students;
GO


CREATE TABLE Honored_Students (
    StudentID INT,
    StudentName VARCHAR(100),
    BirthDate DATE,
    Gender VARCHAR(10), 
    EnrollmentDate DATE,
    Email VARCHAR(100),
    GradeLevel INT,
    Track VARCHAR(20),
    GPA DECIMAL(5,2)
);
GO

INSERT INTO Honored_Students
SELECT * 
FROM Students_Info
WHERE GPA > 90;
GO


IF OBJECT_ID('Failed_Students', 'U') IS NOT NULL
    DROP TABLE Failed_Students;
GO


CREATE TABLE Failed_Students (
    StudentID INT,
    StudentName VARCHAR(100),
    BirthDate DATE,
    Gender VARCHAR(10), 
    EnrollmentDate DATE,
    Email VARCHAR(100),
    GradeLevel INT,
    Track VARCHAR(20),
    GPA DECIMAL(5,2)
);
GO

INSERT INTO Failed_Students
SELECT * 
FROM Students_Info
WHERE GPA < 60;
GO


SELECT StudentName
FROM Students_Info
WHERE StudentName LIKE 'A%';
GO


SELECT StudentName
FROM Students_Info
WHERE LEN(StudentName) = 4;
GO


SELECT 
    AVG(GPA) AS AverageGPA,
    MAX(GPA) AS MaxGPA,
    MIN(GPA) AS MinGPA
FROM Students_Info;
GO


SELECT StudentName
FROM Students_Info
WHERE GradeLevel = 6 AND GPA = 100;
GO


SELECT StudentName, BirthDate
FROM Students_Info
WHERE GradeLevel = 1 AND DATEDIFF(YEAR, BirthDate, GETDATE()) BETWEEN 15 AND 16;
GO


SELECT COUNT(*) AS StudentCount
FROM Students_Info
WHERE GradeLevel = 2;
GO


SELECT DISTINCT Track
FROM Students_Info;
GO

IF OBJECT_ID('Subjects', 'U') IS NOT NULL
    DROP TABLE Subjects;
GO


CREATE TABLE Subjects (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectName VARCHAR(100)
);
GO


INSERT INTO Subjects (SubjectName)
VALUES ('Mathematics'), ('Science'), ('History'), ('Geography');
GO


SELECT UPPER(SubjectName) AS SubjectName
FROM Subjects;
GO


SELECT FLOOR(AVG(GPA)) AS AverageGPA
FROM Students_Info;
GO


UPDATE Students_Info
SET Gender = CASE
    WHEN Gender = 'F' THEN 'Female'
    WHEN Gender = 'M' THEN 'Male'
    ELSE Gender
END;
GO

-- Increase GPA by 5 for Students with GPA < 60
UPDATE Students_Info
SET GPA = GPA + 5
WHERE GPA < 60;
GO

