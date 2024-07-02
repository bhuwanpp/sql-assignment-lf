-- Find students who are not enrolled in any courses.
SELECT * FROM Students
WHERE student_id NOT IN (
    SELECT student_id
    FROM Enrollments
);
