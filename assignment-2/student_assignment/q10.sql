-- Find the grade of students enrolled in the History course.
SELECT student_name,(
        Select
        grade_name from grades G where
        S.student_grade_id = G.grade_id
        ) as Grade from Students S
        where student_id in (
        select student_id from Enrollments E
        where E.course_id = (
                Select course_id from courses
                where course_name = 'History'
            )
    );