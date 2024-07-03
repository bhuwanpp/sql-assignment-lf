-- Retrieve the course with the highest number of enrollments.
select
	course_id,
	count(course_id) as max_count
from
	Enrollments
group by
	course_id
order by
	max_count desc
limit 1;
