CREATE TRIGGER trg_DeleteCascadeOnCourseDelete
ON Course
INSTEAD OF DELETE
AS
BEGIN
    -- Delete related Exams manually
    DELETE e
    FROM Exam e
    INNER JOIN deleted d ON e.CourseID = d.CourseID;

    -- Now delete the Course itself
    DELETE FROM Course
    WHERE CourseID IN (SELECT CourseID FROM deleted);
END;
GO


ALTER TRIGGER trg_DeleteStudentAnswerOnStudentDelete
ON Student
INSTEAD OF DELETE
AS
BEGIN
    DELETE sa
    FROM StudentAnswer sa
    INNER JOIN deleted d ON sa.StudentID = d.StudentID;

	DELETE SE
    FROM StudentExam SE
    INNER JOIN deleted d ON SE.StudentID = d.StudentID;

    DELETE FROM Student
    WHERE StudentID IN (SELECT StudentID FROM deleted);
END;
GO




CREATE TRIGGER trg_DeleteCascadeOnExamDelete
ON Exam
INSTEAD OF DELETE
AS
BEGIN
    -- Delete StudentAnswers related to the Exam
    DELETE sa
    FROM StudentAnswer sa
    INNER JOIN deleted d ON sa.ExamID = d.ExamID;

    -- Delete StudentExam entries related to the Exam
    DELETE se
    FROM StudentExam se
    INNER JOIN deleted d ON se.ExamID = d.ExamID;

    -- Set ExamID to NULL in related Questions instead of deleting them
    UPDATE q
    SET q.ExamID = NULL
    FROM Question q
    INNER JOIN deleted d ON q.ExamID = d.ExamID;

    -- Finally, delete the Exam itself
    DELETE FROM Exam
    WHERE ExamID IN (SELECT ExamID FROM deleted);
END;
GO



CREATE TRIGGER trg_DeleteCascadeOnQuestionDelete
ON Question
INSTEAD OF DELETE
AS
BEGIN
    -- Delete StudentAnswers first (dependent on QuestionID)
    DELETE sa
    FROM StudentAnswer sa
    INNER JOIN deleted d ON sa.QuestionID = d.QuestionID;

    -- Delete Choices (dependent on QuestionID)
    DELETE c
    FROM Choice c
    INNER JOIN deleted d ON c.QuestionID = d.QuestionID;

    -- Now delete the Question itself
    DELETE FROM Question
    WHERE QuestionID IN (SELECT QuestionID FROM deleted);
END;
GO
