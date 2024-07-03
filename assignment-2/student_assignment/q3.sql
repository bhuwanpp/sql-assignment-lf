-- Find the names of students who are enrolled in more than one course.
select
	student_name
from
	Students
where
	student_id in (
	select
		student_id
	from
		Enrollments
	group by
		student_id
	having
		COUNT(course_id) > 1
);
