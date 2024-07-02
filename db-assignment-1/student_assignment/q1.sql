-- q1 Find all students enrolled in the Math course.
SELECT * FROM Students
WHERE student_id IN (
    SELECT Enrollments.student_id
    FROM Enrollments, Courses
    WHERE Enrollments.course_id = Courses.course_id
    AND Courses.course_name = 'Math'
);

