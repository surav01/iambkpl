-- no. 1(a,i)
select now() as CurrentDateTime;

select concat(current_date()," ",current_time()) as CurrentDateTime;

select current_timestamp() as CurrentDateTime;

-- no. 1(a,ii)
select date_format(now(), "%Y %M %e %a") as CurrentDateTime;

-- no. 1(a,iii)
select concat(first_name,".",last_name,"@example.com") as newEmail
from employees;

-- no. 1(b)
select first_name,format(salary,2) as salary
from employees;

-- no. 1(c)
select concat(first_name," ", last_name) as full_name, date_format(hire_date,"%Y %M %e") as hire_date
from employees;

-- no. 1(d)
-- added new column in employees table
ALTER TABLE employees
ADD created_on datetime;

-- insert values in new create_on column
UPDATE employees
SET created_on = now();

select * from employees;

-- Stored Function no. 1
DELIMITER $$
DROP FUNCTION IF EXISTS no_of_years;
CREATE FUNCTION no_of_years(hire_date date)
RETURNS int
BEGIN
	declare today date;
    select current_date() as today;
	return year(today) - hire_date;
end
$$
    

 
