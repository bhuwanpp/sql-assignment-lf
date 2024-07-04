--Windows function:
--1. Using ROW_NUMBER():
--Question: List all students along with a row number based on their enrollment date in ascending order.

select
	student_name,
	enrollment_date,
	row_number() over (
order by
	enrollment_date asc ) as row_number
from
	enrollments
join students
		using (student_id);
		
--2. Using RANK():
--Question: Rank students based on the number of courses they are enrolled in, handling ties by assigning the same rank.

select
	s.student_name ,
	rank() over(
order by
	count(course_id)) as course_rank
from
	enrollments
inner join students s
		using (student_id)
group by
	student_id,
	s.student_name ;

--3. Using DENSE_RANK():
--Question: Determine the dense rank of courses based on their enrollment count across all students
 
select
	c.course_id ,
	c.course_name,
	dense_rank() over(
order by
	course_enrollment_count desc) as dense_rank
from
	(
	select
		course_id,
		count(student_id) as course_enrollment_count
	from
		enrollments
	group by
		course_id) as course_counts
inner join courses c
		using(course_id);