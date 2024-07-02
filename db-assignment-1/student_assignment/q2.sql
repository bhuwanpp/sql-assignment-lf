-- q2 List all courses taken by students named Bob.
SELECT * FROM Courses
WHERE course_id IN (
    SELECT Enrollments.course_id
    FROM Enrollments, Students
    WHERE Enrollments.student_id = Students.student_id
    AND student_name = 'Bob'
);
