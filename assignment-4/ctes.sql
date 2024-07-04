--Common Table Expressions (CTEs):
--Question 1: Calculate the average salary by department for all Analysts.

with avg_salary_analyst as (
select unit, avg(salary)  as avg_salary
from employees
where designation like '%Analyst'
group by unit
)
select  * from avg_salary_analyst;


--Question 2: List all employees who have used more than 10 leaves.
with most_leave_employees as (
select  first_name, leaves_used
from employees
where leaves_used >10
)
select  * from most_leave_employees;