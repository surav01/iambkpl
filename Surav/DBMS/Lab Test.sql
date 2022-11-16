-- SET- One
-- Write a query in SQL to: 
-- 1. Display the first and last_name, department number, and salary for those employees who earn more than 8000. 
-- 2. Lists the number of employees in each department and only includes departments with more than 5 employees. 
-- 3. Find all the information about the President of the company. 
-- 4. Display the province and department name of the department located in Ontario. 
-- 5. Create an index emp_name on first_name and last_name in the employee table.  

-- no.1
select first_name, last_name, department_id, salary 
from employees 
where salary > 8000;

-- no.2
select count(e.employee_id), d.department_name
from employees e
join departments d
on e.department_id=d.department_id
group by d.department_name
having count(e.employee_id)>5;

-- no.3
select e.first_name, e.last_name, e.salary, j.job_title
from employees e
join jobs j
on e.job_id=j.job_id
where j.job_title="president";

-- no. 4
select l.state_province, d.department_name
from departments d
join locations l
on d.location_id=l.location_id
where l.state_province="ontario";

-- no. 5
create index emp_name
on employees (first_name, last_name);


