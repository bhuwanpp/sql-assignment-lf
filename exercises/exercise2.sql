CREATE SCHEMA IF NOT EXISTS assignment2;

CREATE TABLE assignment2.Employees ( 
emp_id INT  PRIMARY KEY,
emp_name VARCHAR(50) UNIQUE,
Email VARCHAR(50) UNIQUE,
salary DECIMAL CHECK ( salary>25000 ),
department VARCHAR(50) DEFAULT 'Unknown', 
created_at TIMESTAMP DEFAULT CURRENT_DATE
);

CREATE TABLE  assignment2.Location(
location_id SERIAL PRIMARY KEY,
emp_id INT ,
city VARCHAR(50),
state VARCHAR(50),
  FOREIGN KEY(emp_id) REFERENCES assignment2.Employees(emp_id)
);

INSERT INTO assignment2.Employees (emp_id, emp_name, Email,  salary, department)
VALUES
    (1, 'John Doe', 'john.doe@example.com', 30000,'hr'),
    (2, 'Jane Smith', 'jane.smith@example.com', 35000, 'finance'),
    (3, 'Michael Johnson', 'michael.johnson@example.com',  28000,'sales'),
    (4, 'Emily Brown', 'emily.brown@example.com',  26000, 'sales'),
    (6, 'Sarah Wilson', 'sarah.wilson@example.com', 26000 ,'it'),
    (7, 'Kevin Davis', 'kevin.davis@example.com',  50000, 'marketing'),
    (8, 'Lisa Garcia', 'lisa.garcia@example.com',  55000, 'hr'),
    (9, 'Mark Martinez', 'mark.martinez@example.com' ,  40000, 'it');

INSERT INTO assignment2.Employees (emp_id, emp_name, Email,  salary)
VALUES
    (5, 'David Lee', 'david.lee@example.com', 27000),
    (10, 'Mary Rodriguez', 'mary.rodriguez@example.com', 31000);

INSERT INTO assignment2.Location (emp_id, city, state)
VALUES
    (1, 'New York City', 'New York'),
    (2, 'Los Angeles', 'California'),
    (3, 'Chicago', 'Illinois'),
    (4, 'Houston', 'Texas'),
    (5, 'Phoenix', 'Arizona'),
    (6, 'Los Angeles', 'California'),
    (7, 'Dallas', 'Texas'),
    (8, 'Philadelphia', 'Pennsylvania'),
    (9, 'San Diego', 'California'),
    (10, 'Dallas', 'Texas');



-- Qn 2. 
SELECT *  FROM assignment2.Employees
WHERE salary BETWEEN 30000 AND 50000;

-- Qn 3. 
UPDATE assignment2.Employees
SET  salary  = salary + 5000
RETURNING *;


-- Qn 4. 
SELECT * FROM assignment2.Employees
WHERE department = 'sales';

-- Qn 5. 
SELECT * FROM assignment2.Employees 
WHERE Email LIKE 'j%';
 
-- Qn. 6
SELECT department,  AVG(salary) AS Avg_Salary, MIN(salary) AS Min_Salary, MAX(salary) AS Max_Salary
FROM assignment2.Employees
GROUP BY (department)



SELECT city, COUNT(city) AS City_list FROM assignment2.Location
GROUP BY city;
