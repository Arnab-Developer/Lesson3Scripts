USE [Lesson3Database]
GO

-- Create Students table.
CREATE TABLE Students
(
	StudentId INT NOT NULL IDENTITY(1, 1),
	RollNumber INT NOT NULL,
	Name VARCHAR(20) NOT NULL,
	
	CONSTRAINT pk_Students PRIMARY KEY (StudentId),

	-- Roll number should be unique for students.
	CONSTRAINT un_RollNumber UNIQUE (RollNumber)
)
GO

-- Create Grades table.
CREATE TABLE Grades
(
	GradeId INT NOT NULL IDENTITY(1, 1),
	Physics INT NOT NULL,
	Chemistry INT NOT NULL,
	Math INT NOT NULL,

	-- Calculated fields.
	Total AS (Physics + Chemistry + Math),
	Avarage AS ((Physics + Chemistry + Math) / 3),

	StudentId INT NOT NULL,

	CONSTRAINT pk_Grades PRIMARY KEY (GradeId),

	-- One to many relation with Students and Grades.
	CONSTRAINT fk_Students_Grades FOREIGN KEY (StudentId) REFERENCES Students (StudentId)
)
GO

-- Add new field 'GradeValue'.
ALTER TABLE Grades
ADD GradeValue AS
(
	CASE 
		WHEN (((Physics + Chemistry + Math) / 3) BETWEEN 0 AND 49.99) THEN 'Fail'
		WHEN (((Physics + Chemistry + Math) / 3) BETWEEN 50 AND 69.99) THEN 'Fair'
		WHEN (((Physics + Chemistry + Math) / 3) BETWEEN 70 AND 89.99) THEN 'Good'
		WHEN (((Physics + Chemistry + Math) / 3) BETWEEN 90 AND 100) THEN 'Excellent'
	END
)
GO

-- Insert data.
INSERT INTO Students (RollNumber, Name)
VALUES (1, 'Dilip')
INSERT INTO Grades (Physics, Chemistry, Math, StudentId)
VALUES (70, 80, 90, SCOPE_IDENTITY())

INSERT INTO Students (RollNumber, Name)
VALUES (2, 'Partho')
INSERT INTO Grades (Physics, Chemistry, Math, StudentId)
VALUES (85, 75, 65, SCOPE_IDENTITY())

INSERT INTO Students (RollNumber, Name)
VALUES (3, 'Anita')
INSERT INTO Grades (Physics, Chemistry, Math, StudentId)
VALUES (55, 70, 76, SCOPE_IDENTITY())

INSERT INTO Students (RollNumber, Name)
VALUES (4, 'Subodh')
INSERT INTO Grades (Physics, Chemistry, Math, StudentId)
VALUES (45, 55, 50, SCOPE_IDENTITY())

INSERT INTO Students (RollNumber, Name)
VALUES (5, 'Payel')
INSERT INTO Grades (Physics, Chemistry, Math, StudentId)
VALUES (85, 90, 95, SCOPE_IDENTITY())

INSERT INTO Students (RollNumber, Name)
VALUES (6, 'Subhasish')
INSERT INTO Grades (Physics, Chemistry, Math, StudentId)
VALUES (45, 48, 40, SCOPE_IDENTITY())
GO

-- Display the student name and grade value who have 'excellent' grade.
SELECT S.Name, G.GradeValue
FROM Students AS S
INNER JOIN Grades AS G ON S.StudentId = G.StudentId
WHERE G.GradeValue = 'Excellent'
GO

-- Display student records who have 'i' in third char name.
SELECT *
FROM Students AS S
WHERE S.Name LIKE '__i%'
GO
