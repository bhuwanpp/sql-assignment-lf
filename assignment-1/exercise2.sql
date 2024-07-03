create schema if not exists assignment2;

create table assignment2.Employees ( 
emp_id INT primary key,
emp_name VARCHAR(50) unique,
Email VARCHAR(50) unique,
salary DECIMAL check ( salary>25000 ),
department VARCHAR(50) default 'Unknown', 
created_at TIMESTAMP default CURRENT_DATE
);

create table assignment2.Location(
location_id SERIAL primary key,
emp_id INT ,
city VARCHAR(50),
state VARCHAR(50),
  foreign key(emp_id) references assignment2.Employees(emp_id)
);

insert
	into
	assignment2.Employees (emp_id,
	emp_name,
	Email,
	salary,
	department)
values
    (1,
'John Doe',
'john.doe@example.com',
30000,
'hr'),
    (2,
'Jane Smith',
'jane.smith@example.com',
35000,
'finance'),
    (3,
'Michael Johnson',
'michael.johnson@example.com',
28000,
'sales'),
    (4,
'Emily Brown',
'emily.brown@example.com',
26000,
'sales'),
    (6,
'Sarah Wilson',
'sarah.wilson@example.com',
26000 ,
'it'),
    (7,
'Kevin Davis',
'kevin.davis@example.com',
50000,
'marketing'),
    (8,
'Lisa Garcia',
'lisa.garcia@example.com',
55000,
'hr'),
    (9,
'Mark Martinez',
'mark.martinez@example.com' ,
40000,
'it');

insert
	into
	assignment2.Employees (emp_id,
	emp_name,
	Email,
	salary)
values
    (5,
'David Lee',
'david.lee@example.com',
27000),
    (10,
'Mary Rodriguez',
'mary.rodriguez@example.com',
31000);

insert
	into
	assignment2.Location (emp_id,
	city,
	state)
values
    (1,
'New York City',
'New York'),
    (2,
'Los Angeles',
'California'),
    (3,
'Chicago',
'Illinois'),
    (4,
'Houston',
'Texas'),
    (5,
'Phoenix',
'Arizona'),
    (6,
'Los Angeles',
'California'),
    (7,
'Dallas',
'Texas'),
    (8,
'Philadelphia',
'Pennsylvania'),
    (9,
'San Diego',
'California'),
    (10,
'Dallas',
'Texas');
-- Qn 2. 
select
	*
from
	assignment2.Employees
where
	salary between 30000 and 50000;
-- Qn 3. 
update
	assignment2.Employees
set
	salary = salary + 5000
returning *;
-- Qn 4. 
select
	*
from
	assignment2.Employees
where
	department = 'sales';
-- Qn 5. 
select
	*
from
	assignment2.Employees
where
	Email like 'j%';
-- Qn. 6
select
	department,
	AVG(salary) as Avg_Salary,
	MIN(salary) as Min_Salary,
	MAX(salary) as Max_Salary
from
	assignment2.Employees
group by
	(department)



select
	city,
	COUNT(city) as City_list
from
	assignment2.Location
group by
	city;
