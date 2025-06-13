-- Create the database
CREATE DATABASE ExaminationSystem;
GO

-- Use the newly created database
USE ExaminationSystem;
GO

-- Company Table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    CompanyLocation VARCHAR(100)
);
GO

-- Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
);
GO

-- Instructor Table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    InsName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Specialization VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
        ON DELETE SET NULL ON UPDATE CASCADE
);
GO
-- Alter Department to add ManagerID after Instructor is created
ALTER TABLE Department ADD ManagerID INT;


CREATE TRIGGER trg_DeleteInstructor
ON Instructor
INSTEAD OF DELETE
AS
BEGIN
    -- Set ManagerID = NULL in Department before deleting Instructor
    UPDATE Department
    SET ManagerID = NULL
    WHERE ManagerID IN (SELECT InstructorID FROM deleted);

    -- Now delete the instructor
    DELETE FROM Instructor WHERE InstructorID IN (SELECT InstructorID FROM deleted);
END;
GO


-- Track Table
CREATE TABLE Track (
    TrackID INT PRIMARY KEY,
    TrackName VARCHAR(100) NOT NULL,
    NoStudent INT CHECK (NoStudent >= 0),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
        ON DELETE SET NULL ON UPDATE CASCADE
);
GO

-- Branch Table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);
GO

-- Intake Table
CREATE TABLE Intake (
    IntakeID INT PRIMARY KEY,
    IntakeName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);
GO

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    CreditHours INT CHECK (CreditHours > 0)
);
GO

-- Topic Table
CREATE TABLE Topic (
    TopicID INT PRIMARY KEY,
    TopicName VARCHAR(200) NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE TrackCourse (
    TrackID INT,
    CourseID INT,
    PRIMARY KEY (TrackID, CourseID),
    FOREIGN KEY (TrackID) REFERENCES Track(TrackID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Phone VARCHAR(20),
    Age INT CHECK (Age > 0),
    Zip VARCHAR(20),
    City VARCHAR(50),
    SocialLink VARCHAR(100),
    TrackID INT,
    CompanyID INT,
    FOREIGN KEY (TrackID) REFERENCES Track(TrackID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
        ON DELETE SET NULL ON UPDATE CASCADE
);
GO

-- Certificate Table
CREATE TABLE Certificate (
    CertificateID INT PRIMARY KEY,
    IssueDate DATE NOT NULL,
    FilePath VARCHAR(255)
);
GO

ALTER TABLE dbo.Certificate DROP COLUMN IssueDate
ALTER TABLE dbo.Certificate DROP COLUMN FilePath
ALTER TABLE dbo.Certificate ADD CertificateName VARCHAR(100)
ALTER TABLE dbo.Certificate ADD CertificateURL VARCHAR(200)



-- StudentCertificate Table
CREATE TABLE StudentCertificate (
    StudentID INT,
    CertificateID INT,
    Grade VARCHAR(5) CHECK (Grade IN ('A','B','C','D','E','F')),
    PRIMARY KEY (StudentID, CertificateID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CertificateID) REFERENCES Certificate(CertificateID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO
ALTER TABLE dbo.StudentCertificate ADD IssueDate DATE


-- StudentSkills Table
CREATE TABLE StudentSkills (
    StudentID INT,
    SkillsText VARCHAR(50),
    PRIMARY KEY (StudentID, SkillsText),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Job Table
CREATE TABLE Job (
    JobID INT PRIMARY KEY,
    JobDescription VARCHAR(100),
    Platform VARCHAR(100),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
        ON DELETE SET NULL ON UPDATE CASCADE
);
GO

-- BranchIntakeTrack Table
CREATE TABLE BranchIntakeTrack (
    BranchID INT,
    IntakeID INT,
    TrackID INT,
    PRIMARY KEY (BranchID, IntakeID, TrackID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IntakeID) REFERENCES Intake(IntakeID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TrackID) REFERENCES Track(TrackID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- InsBranch Table
CREATE TABLE InsBranch (
    InstructorID INT,
    BranchID INT,
    PRIMARY KEY (InstructorID, BranchID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- InsCourse Table
CREATE TABLE InsCourse (
    InstructorID INT,
    CourseID INT,
    PRIMARY KEY (InstructorID, CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Topic Table
CREATE TABLE Topic (
    TopicID INT PRIMARY KEY,
    TopicName VARCHAR(100) NOT NULL,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

DROP TABLE Topic


-- StudentCourseRating Table
CREATE TABLE StudentCourseRating (
    StudentID INT,
    CourseID INT,
    Date DATE,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- StudentEnrollment Table
CREATE TABLE StudentEnrollment (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Exam Table
CREATE TABLE Exam (
    ExamID INT PRIMARY KEY,
    Date DATE NOT NULL,
    StartTime TIME,
    EndTime TIME,
    Grade INT CHECK (Grade BETWEEN 0 AND 100),
    DifficultyLevel VARCHAR(20),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Recreate with ON DELETE CASCADE
ALTER TABLE Exam
ADD CONSTRAINT FK_Exam_Course
FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
    ON UPDATE CASCADE;



DROP TABLE IF EXISTS StudentExam;
GO
-- StudentExam Table
CREATE TABLE StudentExam (
    StudentID INT,
    ExamID INT,
    StudentGrade INT CHECK (StudentGrade BETWEEN 0 AND 100),
    PRIMARY KEY (StudentID, ExamID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
        
);
GO


DROP TABLE IF EXISTS Question;
GO


-- Question Table
CREATE TABLE Question (
    QuestionID INT IDENTITY(1,1) PRIMARY KEY,
    Type VARCHAR(50),
    QuestionText TEXT NOT NULL,
    CorrectAnswer TEXT,
    Grade INT CHECK (Grade BETWEEN 0 AND 100),
    ExamID INT FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)

);
GO

alter table Question 

-- Drop and recreate the Choice table
DROP TABLE IF EXISTS Choice;
GO

-- Choice Table
CREATE TABLE Choice (
    ChoiceID INT IDENTITY(1,1) PRIMARY KEY,
    AnswerText VARCHAR(255),
    QuestionID INT,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
		on delete cascade on update cascade

);
GO



drop table if exists StudentAnswer
-- StudentAnswer Table
CREATE TABLE StudentAnswer (
    StudentID INT,
    ExamID INT,
    QuestionID INT,
    StudentAnswer TEXT,
    PRIMARY KEY (StudentID, QuestionID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),    
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),    
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
        
);
GO





