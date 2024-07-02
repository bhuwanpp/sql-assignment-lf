-- Find the names of students who are enrolled in more than one course.
SELECT student_name FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    GROUP BY student_id
    HAVING COUNT(course_id) > 1
);
