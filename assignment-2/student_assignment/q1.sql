-- q1 Find all students enrolled in the Math course.
select
	*
from
	Students
where
	student_id in (
	select
		Enrollments.student_id
	from
		Enrollments,
		Courses
	where
		Enrollments.course_id = Courses.course_id
		and Courses.course_name = 'Math'
);

