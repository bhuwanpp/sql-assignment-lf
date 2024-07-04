--Views:
--Question 3: Create a view to show the details of all Senior Analysts.
create view  all_senior_analysts as 
(
select * from 
employees 
where  designation = 'Senior Analyst'
);
drop view all_senior_analysts ;

select  * from all_senior_analysts ;


--Materialized Views:
--Question 4: Create a materialized view to store the count of employees by department.

create materialized view count_employees_department as
select  unit, count(unit)as count 
from employees
group by unit;


-- refresh view to update data 
refresh materialized view  count_employees_department;

drop materialized view count_employees_department;

select  * from count_employees_department;