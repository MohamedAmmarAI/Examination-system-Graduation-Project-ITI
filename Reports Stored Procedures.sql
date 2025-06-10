CREATE PROCEDURE GetStudentReportByDepartment
    @DepartmentNo INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        S.StudentID,
        S.StudentName,
        S.Email,
        S.Gender,
        S.Phone,
        S.Age,
        S.City,
        S.SocialLink,
        T.TrackName,
        D.DeptName
    FROM 
        Student S
    INNER JOIN 
        Track T ON S.TrackID = T.TrackID
    INNER JOIN 
        Department D ON T.DeptID = D.DeptID
    WHERE 
        D.DeptID = @DepartmentNo;
END;


EXEC GetStudentReportByDepartment @DepartmentNo = 1;


-------------------------------------------------------

CREATE PROCEDURE GetStudentGradesByID
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.CourseID,
        C.Title AS CourseTitle,
        E.ExamID,
        SE.StudentGrade,
        E.Grade AS TotalPossible,
        CAST(SE.StudentGrade * 100.0 / NULLIF(E.Grade, 0) AS DECIMAL(5,2)) AS Percentage
    FROM 
        StudentExam SE
    INNER JOIN 
        Exam E ON SE.ExamID = E.ExamID
    INNER JOIN 
        Course C ON E.CourseID = C.CourseID
    WHERE 
        SE.StudentID = @StudentID;
END;


EXEC GetStudentGradesByID @StudentID = 2;

-------------------------------------------------------

ALTER PROCEDURE GetInstructorCoursesWithStudentCount
    @InstructorID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.CourseID,
        C.Title AS CourseName,
        COUNT(DISTINCT SE.StudentID) AS NumberOfStudents
    FROM 
        InsCourse IC
    INNER JOIN 
        StudentEnrollment SE on SE.CourseID = IC.CourseID
		inner join course c on c.CourseID = se.CourseID
    where IC.InstructorID = @InstructorID
	GROUP BY 
        C.CourseID, C.Title;
END;

EXEC GetInstructorCoursesWithStudentCount @InstructorID = 2;

------------------------------------------------------


CREATE PROCEDURE GetTopicsByCourse
    @CourseID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        T.TopicID,
        T.TopicName,
        C.Title AS CourseTitle
    FROM 
        Topic T
    INNER JOIN 
        Course C ON T.CourseID = C.CourseID
    WHERE 
        T.CourseID = @CourseID;
END;


EXEC GetTopicsByCourse @CourseID = 5;


-------------------------------------------------------

ALTER PROCEDURE GetExamQuestionsWithChoices
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Q.QuestionID,
        Q.QuestionText,
        Q.Type,
        C.AnswerText AS ChoiceText
    FROM 
        Question Q
    Left JOIN 
        Choice C ON Q.QuestionID = C.QuestionID
    WHERE 
        Q.ExamID = @ExamID
    ORDER BY 
        Q.QuestionID, C.ChoiceID;
END;


EXEC GetExamQuestionsWithChoices @ExamID = 1;

-------------------------------------------------------

CREATE PROCEDURE GetStudentAnswersByExam
    @ExamID INT,
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Q.QuestionID,
        Q.QuestionText,
        Q.Type,
        Q.CorrectAnswer,
        SA.StudentAnswer
    FROM 
        Question Q
    LEFT JOIN 
        StudentAnswer SA 
            ON Q.QuestionID = SA.QuestionID 
            AND SA.StudentID = @StudentID
    WHERE 
        Q.ExamID = @ExamID
    ORDER BY 
        Q.QuestionID;
END;

EXEC GetStudentAnswersByExam @ExamID = 1, @StudentID = 1;

