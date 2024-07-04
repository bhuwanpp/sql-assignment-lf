
--1. Inner Join:
--Question: Retrieve the list of students and their enrolled courses.

select
	 s.student_name ,
	c.course_name ,
	c.course_description
from
	Students s
inner join enrollments e on
	s.student_id = e.student_id
inner join courses c on
	e.course_id = c.course_id;

--2. Left Join:
--Question: List all students and their enrolled courses, including those who haven't enrolled in any course.

select
	 s.student_name ,
	c.course_name ,
	c.course_description
from
	Students s
left join enrollments e on
	s.student_id = e.student_id
left join courses c on
	e.course_id = c.course_id;

--3. Right Join:
--Question: Display all courses and the students enrolled in each course, including courses with no enrolled students.
select
	c.course_id,
	c.course_name,
	s.student_id,
	s.student_name
from
	Courses c
right join Enrollments e on
	c.course_id = e.course_id
right join Students s on
	e.student_id = s.student_id;
--4. Self Join:
--Question: Find pairs of students who are enrolled in at least one common course.

select
	distinct s1.student_id as student_id_1,
	s1.student_name as student_name_1,
	s2.student_id as student_id_2,
	s2.student_name as student_name_2
from
	Students s1
inner join Enrollments e1 on
	s1.student_id = e1.student_id
inner join Enrollments e2 on
	e1.course_id = e2.course_id
	and e1.student_id < e2.student_id
inner join Students s2 on
	e2.student_id = s2.student_id;

--5. Complex Join:
--Question: Retrieve students who are enrolled in 'Introduction to CS' but not in 'Data Structures'.

select
	distinct 
	 s.student_name ,
	c.course_name
from
	Students s
inner join enrollments e on
	s.student_id = e.student_id
inner join courses c on
	e.course_id = c.course_id
	and c.course_name = 'Introduction to CS'
where
	s.student_id not in (
	select
		s2.student_id
	from
		Students s2
	inner join enrollments e2 on
		s2.student_id = e2.student_id
	inner join courses c2 on
		e2.course_id = c2.course_id
	where
		c2.course_name = 'Data Structures'
    );
