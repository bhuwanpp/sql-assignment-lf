--Procedures (Stored Procedures):
--Question 6: Create a procedure to update an employee's salary by their first name and last name

create  or replace procedure update_salary (
first varchar(50),
last varchar(50),
amount int
)
language  plpgsql
as $$ 
begin 
	update  employees 
	set salary  = salary + amount;
	commit;
end;$$;


call update_salary('olive', 'ancy' , 10000)

select * from employees 
where first_name  = 'OLIVE';


--Question 7: Create a procedure to calculate the total number of leaves used across all departments.

create  or replace procedure total_leaves ()
language  plpgsql
as $$ 
begin 
	create view leave_used_total as 
	select  sum(leaves_used) as all_leaves from
	employees
	commit;
end;$$;

-- call the procedure
call total_leaves()

select * from leave_used_total;