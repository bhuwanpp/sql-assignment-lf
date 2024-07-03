-- Retrieve the course with the highest number of enrollments.
SELECT course_id,count(course_id) as max_count
FROM Enrollments 
GROUP BY course_id
order by  max_count desc
LIMIT 1;