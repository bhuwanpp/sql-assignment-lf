-- List students who are enrolled in all available courses.
SELECT * FROM Students 
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE course_id IN (101, 102, 103)
    GROUP BY student_id
    HAVING COUNT(DISTINCT course_id) = 3 
);

-- for all 
SELECT student_name FROM Students WHERE student_id IN (
        SELECT
            student_id FROM Enrollments GROUP BY student_id HAVING
            COUNT(course_id) = (
                SELECT COUNT(course_id)
                FROM Courses
            )
    );