CREATE PROCEDURE dbo.SelectAllStudents
AS
BEGIN
    SELECT * FROM dbo.Student;
END;
GO

CREATE PROCEDURE dbo.InsertStudent
    @StudentID INT,
    @StudentName VARCHAR(100),
    @Email VARCHAR(100),
    @Gender VARCHAR(10),
    @Phone VARCHAR(20),
    @Age INT,
    @Zip VARCHAR(20),
    @City VARCHAR(50),
    @SocialLink VARCHAR(100),
    @TrackID INT,
    @CompanyID INT
AS
BEGIN
    INSERT INTO dbo.Student (
        StudentID, StudentName, Email, Gender, Phone, Age, Zip, City, SocialLink, TrackID, CompanyID
    )
    VALUES (
        @StudentID, @StudentName, @Email, @Gender, @Phone, @Age, @Zip, @City, @SocialLink, @TrackID, @CompanyID
    );
END;
GO

CREATE PROCEDURE dbo.UpdateStudent
    @StudentID INT,
    @StudentName VARCHAR(100),
    @Email VARCHAR(100),
    @Gender VARCHAR(10),
    @Phone VARCHAR(20),
    @Age INT,
    @Zip VARCHAR(20),
    @City VARCHAR(50),
    @SocialLink VARCHAR(100),
    @TrackID INT,
    @CompanyID INT
AS
BEGIN
    UPDATE dbo.Student
    SET
        StudentName = @StudentName,
        Email = @Email,
        Gender = @Gender,
        Phone = @Phone,
        Age = @Age,
        Zip = @Zip,
        City = @City,
        SocialLink = @SocialLink,
        TrackID = @TrackID,
        CompanyID = @CompanyID
    WHERE StudentID = @StudentID;
END;
GO

CREATE PROCEDURE dbo.DeleteStudent
    @StudentID INT
AS
BEGIN
    DELETE FROM dbo.Student
    WHERE StudentID = @StudentID;
END;
GO






ALTER PROCEDURE dbo.GenerateExam
    @ExamID INT,
    @QuestionCount INT,
    @ExamDate DATE,
    @StartTime TIME,
    @EndTime TIME,
    @CourseID INT,
    @DifficultyLevel VARCHAR(20),
    @Grade INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Insert a new exam
    INSERT INTO Exam (ExamID, Date, StartTime, EndTime, Grade, CourseID, DifficultyLevel)
    VALUES (@ExamID, @ExamDate, @StartTime, @EndTime, @Grade, @CourseID, @DifficultyLevel);

    -- Step 2: Assign random, unassigned questions related to the course
    --UPDATE Question
    --SET Question.ExamID = @ExamID
    --WHERE QuestionID IN (
    --    SELECT *
    --    FROM Question inner join Exam on Question.ExamID = Exam.ExamID
    --    WHERE Exam.CourseID = @CourseID
     --);
END;
GO

EXEC dbo.GenerateExam
    @ExamID = 50,
    @QuestionCount = 5,
    @ExamDate = '2025-06-15',
    @StartTime = '10:00',
    @EndTime = '11:00',
    @CourseID = 3,
	@Grade = 100, 
    @DifficultyLevel = 'Medium';




CREATE PROCEDURE GetExamAnswers
@ExamID INT = NULL,
@StudentID INT = NULL
AS
BEGIN
    SELECT 
        sa.StudentID,
        sa.ExamID,
        sa.QuestionID,
        sa.StudentAnswer,
        q.CorrectAnswer,
        CASE 
            WHEN CAST(sa.StudentAnswer AS VARCHAR(MAX)) = CAST(q.CorrectAnswer AS VARCHAR(MAX)) THEN 1
            ELSE 0
        END AS IsCorrect
    FROM StudentAnswer sa
    INNER JOIN Question q ON sa.QuestionID = q.QuestionID
    WHERE (@ExamID IS NULL OR sa.ExamID = @ExamID)
      AND (@StudentID IS NULL OR sa.StudentID = @StudentID)
    ORDER BY sa.StudentID, sa.ExamID, sa.QuestionID;
END;


ALTER PROCEDURE CorrectExam
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary table to hold correction results
    IF OBJECT_ID('tempdb..#CorrectionResults') IS NOT NULL
        DROP TABLE #CorrectionResults;

    CREATE TABLE #CorrectionResults (
        StudentID INT,
        ExamID INT,
        TotalQuestions INT,
        CorrectAnswers INT,
        ScorePercent DECIMAL(5,2)
    );

    -- Insert correction data
    INSERT INTO #CorrectionResults (StudentID, ExamID, TotalQuestions, CorrectAnswers, ScorePercent)
    SELECT 
        sa.StudentID,
        sa.ExamID,
        COUNT(*) AS TotalQuestions,
        SUM(CASE 
                WHEN CAST(sa.StudentAnswer AS VARCHAR(MAX)) = CAST(q.CorrectAnswer AS VARCHAR(MAX)) 
                THEN 1 ELSE 0 
            END) AS CorrectAnswers,
        CAST(
            100.0 * SUM(CASE 
                    WHEN CAST(sa.StudentAnswer AS VARCHAR(MAX)) = CAST(q.CorrectAnswer AS VARCHAR(MAX)) 
                    THEN 1 ELSE 0 
                END) / COUNT(*) AS DECIMAL(5,2)
        ) AS ScorePercent
    FROM StudentAnswer sa
    INNER JOIN Question q ON sa.QuestionID = q.QuestionID
    WHERE sa.ExamID = @ExamID
    GROUP BY sa.StudentID, sa.ExamID;


	update StudentExam
	set StudentGrade = (select ScorePercent from #CorrectionResults where #CorrectionResults.StudentID = StudentExam.StudentID)

    
	-- Return results
    SELECT * FROM #CorrectionResults;
END;


--------------------------- EXECUTION -----------------------------

EXEC CorrectExam @ExamID = 1;




-- Insert example
EXEC dbo.InsertStudent 12, 'Mahmoud Saied', 'mahmoud@email.com', 'Male', '0111111121', 26, '12355', 'Cairo', 'fb.com/mahmoud', 10, 10;

-- Select all
EXEC dbo.SelectAllStudents;

-- Update example
EXEC dbo.UpdateStudent 12, 'Adel Ali', 'adel@email.com', 'Male', '0111111122', 23, '12356', 'Alex', 'fb.com/adel', 3, 3;

-- Delete example
EXEC dbo.DeleteStudent 12;



EXEC GetExamAnswers @ExamID = 1;
EXEC GetExamAnswers @StudentID = 2;
EXEC GetExamAnswers @StudentID = 4, @ExamID = 4;










-- Stored Procedure to Delete All Data -----------


-- Drop if it already exists
IF OBJECT_ID('sp_DeleteAllData', 'P') IS NOT NULL
    DROP PROCEDURE sp_DeleteAllData;
GO

CREATE PROCEDURE sp_DeleteAllData
AS
BEGIN
    SET NOCOUNT ON;

    -- Disable all foreign key constraints temporarily
    EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

    -- Delete data from child to parent tables
    BEGIN TRY
        DELETE FROM StudentAnswer;
        DELETE FROM Choice;
        DELETE FROM Question;
        DELETE FROM StudentExam;
        DELETE FROM StudentCourseRating;
        DELETE FROM StudentEnrollment;
        DELETE FROM InsCourse;
        DELETE FROM InsBranch;
        DELETE FROM BranchIntakeTrack;
        DELETE FROM Job;
        DELETE FROM StudentSkills;
        DELETE FROM StudentCertificate;
        DELETE FROM Certificate;
        DELETE FROM Student;
        DELETE FROM Exam;
        DELETE FROM Topic;
        DELETE FROM Course;
        DELETE FROM Intake;
        DELETE FROM Branch;
        DELETE FROM Track;
        DELETE FROM Instructor;
        DELETE FROM Department;
        DELETE FROM Company;
    END TRY
    BEGIN CATCH
        -- Error handling
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH

    -- Re-enable foreign key constraints
    EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';

    PRINT 'All data has been successfully deleted.';
END;
GO
