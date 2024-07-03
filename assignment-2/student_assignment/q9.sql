
-- Retrieve the average age of students enrolled in the Science course.
select
	AVG(student_age) as Avg_age
from
	Students
where
	student_id in (
	select
		student_id
	from
		Enrollments
	where
		course_id = (
		select
			course_id
		from
			courses
		where
			course_name = 'Science'
            )
    );
   