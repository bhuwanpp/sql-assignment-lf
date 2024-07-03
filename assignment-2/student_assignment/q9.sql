-- Retrieve the average age of students enrolled in the Science course.
SELECT AVG(student_age) AS avg_age FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE course_id = 102
);

