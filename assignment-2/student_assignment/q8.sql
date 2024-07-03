-- Find students who are not enrolled in any courses.
select
	*
from
	Students
where
	student_id not in (
	select
		student_id
	from
		Enrollments
);

   