CREATE DATABASE ExaminationSystem_DWH_New;
GO

USE ExaminationSystem_DWH_New;
GO

--------------------- DimExam ---------------------
CREATE TABLE DimExam (
    ExamSK INT PRIMARY KEY IDENTITY(1,1),
    ExamID INT NULL,
    ExamDate DATETIME,
    StartTime TIME,
    EndTime TIME,
    Grade FLOAT,
    DifficultyLevel CHAR(20),
    CourseID INT
);

--------------------- DimStudent ------------------
CREATE TABLE DimStudent (
    StudentSK INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NULL,
    StudentName VARCHAR(50),
    Email VARCHAR(255),
    Gender VARCHAR(10),
    Phone VARCHAR(20),
    Age INT,
    City VARCHAR(50),
    SocialLink VARCHAR(100) NULL,
    TrackID INT NULL,
    CompanyID INT NULL,
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT DEFAULT 1
);

---------------------- DimCourse ------------------
CREATE TABLE DimCourse (
    CourseSK INT PRIMARY KEY IDENTITY(1,1),
    CourseID VARCHAR(50) NOT NULL,
    CourseTitle VARCHAR(50),
    CreditHours INT
);

-------------------- DimQuestion ------------------
CREATE TABLE DimQuestion (
    QuestionSK INT PRIMARY KEY IDENTITY(1,1),
    QuestionID INT NOT NULL,
    QuestionType VARCHAR(50),
    QuestionText TEXT,
    CorrectAnswer TEXT,
    ExamID INT
);

------------------- DimInstructor -----------------
CREATE TABLE DimInstructor (
    InstructorSK INT PRIMARY KEY IDENTITY(1,1),
    InstructorID INT NOT NULL,
    InstructorName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Gender VARCHAR(20),
    Specialization VARCHAR(50),
    DeptID INT,
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT DEFAULT 1
);

--------------------- DimBranch -------------------
CREATE TABLE DimBranch (
    BranchSK INT PRIMARY KEY IDENTITY(1,1),
    BranchID INT NOT NULL,
    BranchName VARCHAR(50),
    Location VARCHAR(50)
);

--------------------- DimIntake -------------------
CREATE TABLE DimIntake (
    IntakeSK INT PRIMARY KEY IDENTITY(1,1),
    IntakeID INT NOT NULL,
    IntakeName VARCHAR(50),
    StartDate DATE,
    EndDate DATE
);

---------------------- DimDate --------------------
CREATE TABLE DimDate (
    DateSK INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Year INT
);



---------------------- FactStudent ---------------------
CREATE TABLE FactStudent (
    StudentExamFactSK INT PRIMARY KEY IDENTITY(1,1),
    StudentSK INT NOT NULL,
    CourseSK INT NOT NULL,
    ExamSK INT NOT NULL,
    DateSK INT NOT NULL,
    InstructorSK INT NOT NULL,
    BranchSK INT NOT NULL,
    IntakeSK INT NOT NULL,
    QuestionSK INT NOT NULL,
    Score DECIMAL(5, 2),
    -- Foreign Keys
    FOREIGN KEY (StudentSK) REFERENCES DimStudent(StudentSK),
    FOREIGN KEY (CourseSK) REFERENCES DimCourse(CourseSK),
    FOREIGN KEY (ExamSK) REFERENCES DimExam(ExamSK),
    FOREIGN KEY (DateSK) REFERENCES DimDate(DateSK),
    FOREIGN KEY (InstructorSK) REFERENCES DimInstructor(InstructorSK),
    FOREIGN KEY (BranchSK) REFERENCES DimBranch(BranchSK),
    FOREIGN KEY (IntakeSK) REFERENCES DimIntake(IntakeSK),
    FOREIGN KEY (QuestionSK) REFERENCES DimQuestion(QuestionSK)
);

-- Indexes for Performance
CREATE INDEX idx_FactStudent_StudentSK ON FactStudent(StudentSK);
CREATE INDEX idx_FactStudent_CourseSK ON FactStudent(CourseSK);
CREATE INDEX idx_FactStudent_ExamSK ON FactStudent(ExamSK);
CREATE INDEX idx_FactStudent_DateSK ON FactStudent(DateSK);
CREATE INDEX idx_FactStudent_InstructorSK ON FactStudent(InstructorSK);
CREATE INDEX idx_FactStudent_BranchSK ON FactStudent(BranchSK);
CREATE INDEX idx_FactStudent_IntakeSK ON FactStudent(IntakeSK);
CREATE INDEX idx_FactStudent_QuestionSK ON FactStudent(QuestionSK);




INSERT INTO ExaminationSystem_DWH_New.dbo.DimStudent (
    StudentID,
    StudentName,
    Email,
    Gender,
    Phone,
    Age,
    City,
    SocialLink,
    TrackID,
    CompanyID
)
SELECT
    S.StudentID,
    S.StudentName,
    S.Email,
    S.Gender,
    S.Phone,
    NULL AS Age,  
    S.City,
    S.SocialLink,
    S.TrackID,
    S.CompanyID
FROM ExaminationSystem.dbo.Student S;



INSERT INTO ExaminationSystem_DWH_New.dbo.DimCourse (
    CourseID,
    CourseTitle,
    CreditHours
)
SELECT
    C.CourseID,
    C.Title,            
    C.CreditHours
FROM ExaminationSystem.dbo.Course C;



INSERT INTO ExaminationSystem_DWH_New.dbo.DimExam (
    ExamID,
    ExamDate,
    StartTime,
    EndTime,
    Grade,
    DifficultyLevel,
    CourseID
)
SELECT
    E.ExamID,
    E.Date,             
    E.StartTime,
    E.EndTime,
    E.Grade,
    E.DifficultyLevel,
    E.CourseID
FROM ExaminationSystem.dbo.Exam E;


INSERT INTO ExaminationSystem_DWH_New.dbo.DimQuestion (
    QuestionID,
    QuestionType,
    QuestionText,
    CorrectAnswer,
    ExamID
)
SELECT 
    Q.QuestionID,
    Q.Type,             
    Q.QuestionText,
    Q.CorrectAnswer,
    Q.ExamID
FROM ExaminationSystem.dbo.Question Q;




INSERT INTO ExaminationSystem_DWH_New.dbo.DimInstructor (
    InstructorID,
    InstructorName,
    Email,
    Phone,
    Gender,
    Specialization,
    DeptID
)
SELECT 
    I.InstructorID,
    I.insName,           
    I.Email,
    I.Phone,
    I.Gender,
    I.Specialization,
    I.DeptID
FROM ExaminationSystem.dbo.Instructor I;



INSERT INTO ExaminationSystem_DWH_New.dbo.DimBranch (BranchID, BranchName, Location)
SELECT
    B.BranchID,
    B.BranchName,
    B.Location
FROM ExaminationSystem.dbo.Branch B;


INSERT INTO ExaminationSystem_DWH_New.dbo.DimIntake (IntakeID, IntakeName, StartDate, EndDate)
SELECT
    I.IntakeID,
    I.IntakeName,
    I.StartDate,
    I.EndDate
FROM ExaminationSystem.dbo.Intake I;


-- Generate Date dimension if not already existing
-- This example creates 5 years of data
DECLARE @Date DATE = '2020-01-01';
WHILE @Date <= '2025-12-31'
BEGIN
    INSERT INTO ExaminationSystem_DWH_New.dbo.DimDate (DateSK, Date, Day, Month, Year)
    VALUES (
        CONVERT(INT, CONVERT(CHAR(8), @Date, 112)), -- YYYYMMDD
        @Date,
        DAY(@Date),
        MONTH(@Date),
        YEAR(@Date)
    );
    SET @Date = DATEADD(DAY, 1, @Date);
END


INSERT INTO ExaminationSystem_DWH_New.dbo.FactStudent (
    StudentSK,
    CourseSK,
    ExamSK,
    DateSK,
    InstructorSK,
    BranchSK,
    IntakeSK,
    QuestionSK,
    Score
)
SELECT
    DS.StudentSK,
    DC.CourseSK,
    DE.ExamSK,
    DD.DateSK,
    DI.InstructorSK,
    DB.BranchSK,
    DIK.IntakeSK,
    DQ.QuestionSK,
    SE.StudentGrade AS Score

FROM ExaminationSystem.dbo.StudentExam SE

-- Join Student
JOIN ExaminationSystem.dbo.Student S ON SE.StudentID = S.StudentID
JOIN DimStudent DS ON DS.StudentID = S.StudentID

-- Join Exam
JOIN ExaminationSystem.dbo.Exam E ON SE.ExamID = E.ExamID
JOIN DimExam DE ON DE.ExamID = E.ExamID

-- Join Course
JOIN ExaminationSystem.dbo.Course C ON E.CourseID = C.CourseID
JOIN DimCourse DC ON DC.CourseID = C.CourseID

-- Join Instructor (via Course)
OUTER APPLY (
    SELECT TOP 1 IC.InstructorID
    FROM ExaminationSystem.dbo.InsCourse IC
    WHERE IC.CourseID = C.CourseID
) AS IC
JOIN DimInstructor DI ON DI.InstructorID = IC.InstructorID

-- Join Branch & Intake (via Student's TrackID)
OUTER APPLY (
    SELECT TOP 1 BranchID, IntakeID
    FROM ExaminationSystem.dbo.BranchIntakeTrack
    WHERE TrackID = S.TrackID
) AS BIT
JOIN DimBranch DB ON DB.BranchID = BIT.BranchID
JOIN DimIntake DIK ON DIK.IntakeID = BIT.IntakeID

-- Join Date
JOIN DimDate DD ON DD.Date = E.Date

-- Join Question (linked by ExamID)
JOIN DimQuestion DQ ON DQ.ExamID = E.ExamID;





