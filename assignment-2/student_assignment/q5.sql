-- Find the number of students enrolled in each course.
SELECT
	(select course_name from courses c where c.course_id = e.course_id) as course_name ,
	COUNT(course_id) AS student_count
FROM Enrollments e
GROUP BY e.course_id;