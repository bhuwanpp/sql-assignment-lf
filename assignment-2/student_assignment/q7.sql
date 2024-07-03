-- List students who are enrolled in all available courses.
SELECT student_name FROM Students WHERE student_id IN (
        SELECT
            student_id FROM Enrollments GROUP BY student_id HAVING
            COUNT(course_id) = (
                SELECT COUNT(course_id) FROM Courses
                )
    );