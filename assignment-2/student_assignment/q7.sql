-- List students who are enrolled in all available courses.
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
		COUNT(course_id) = (
		select
			COUNT(course_id)
		from
			Courses
                )
    );
   