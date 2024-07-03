-- Find the number of students enrolled in each course.
select
	(
	select
		course_name
	from
		courses c
	where
		c.course_id = e.course_id) as course_name ,
	COUNT(course_id) as student_count
from
	Enrollments e
group by
	e.course_id;
