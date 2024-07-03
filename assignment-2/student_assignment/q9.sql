-- Retrieve the average age of students enrolled in the Science course.
SELECT AVG(student_age) as Avg_age FROM Students
WHERE student_id IN (
        SELECT student_id FROM Enrollments
        WHERE course_id = (
                SELECT course_id
                FROM courses
                WHERE course_name = 'Science'
            )
    );