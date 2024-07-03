-- q2 List all courses taken by students named Bob.
select
	*
from
	Courses
where
	course_id in (
	select
		Enrollments.course_id
	from
		Enrollments,
		Students
	where
		Enrollments.student_id = Students.student_id
		and student_name = 'Bob'
);

