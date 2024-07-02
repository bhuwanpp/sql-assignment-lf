-- Find the number of students enrolled in each course.
-- return course_id , student_count

SELECT course_id, COUNT(course_id) AS student_count
FROM Enrollments
GROUP BY course_id;
