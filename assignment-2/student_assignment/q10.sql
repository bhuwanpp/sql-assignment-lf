-- Find the grade of students enrolled in the History course.
SELECT grade_name FROM Grades
WHERE grade_id IN (
    SELECT student_grade_id
    FROM Students
    WHERE student_id IN (
        SELECT student_id FROM Enrollments 
        WHERE course_id = 103
    )
);
