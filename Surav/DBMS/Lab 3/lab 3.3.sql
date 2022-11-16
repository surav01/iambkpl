-- Lab 3
-- Question 1
SELECT COUNT(employee_id)
FROM employees;

-- Question 2
SELECT DISTINCT e.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id;

-- Question 3
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary, AVG(salary) AS average_salary, SUM(salary) AS total_salary
FROM employees;

-- Question 4
SELECT MAX(e.salary)
FROM jobs j, employees e
WHERE e.job_id=j.job_id AND job_title="Accountant";

-- Question 5
SELECT j.job_title, SUM(e.salary)
FROM jobs j, employees e
WHERE e.job_id=j.job_id
GROUP BY j.job_title;

-- Question 6
SELECT e.first_name, e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id;

-- Question 7
SELECT d.department_name, SUM(salary)
FROM employees e, departments d
WHERE e.department_id=d.department_id
GROUP BY d.department_name
HAVING SUM(salary)>40000;

-- Question 8
SELECT department_name, city, state_province, country_name
FROM departments d, locations l, countries c
WHERE d.location_id=l.location_id AND c.country_id=l.country_id;

-- Question 9
SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id AND d.department_name="Accounting";

-- Question 10
SELECT d.department_name, l.city
FROM departments d, locations l
WHERE d.location_id=l.location_id AND l.city="Toronto" OR l.city="Oxford";

-- Question 11
SELECT e.first_name, e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id=j.job_id AND job_title="Sales Representative";

-- Question 12
SELECT COUNT(e.employee_id), c.country_name
FROM employees e, departments d, locations l, countries c
WHERE e.department_id=d.department_id AND d.location_id=l.location_id AND l.country_id=c.country_id
GROUP BY c.country_name;

-- Question 13
SELECT CONCAT(e.first_name," ", e.last_name) AS full_name, CONCAT(l.street_address,", ",l.city,", ",c.country_name) AS full_address
FROM employees e, departments d, locations l, countries c
WHERE e.department_id=d.department_id AND d.location_id=l.location_id AND l.country_id=c.country_id;

-- Question 14
SELECT d.department_name, j.job_title, COUNT(e.employee_id)
FROM departments d, employees e, jobs j
WHERE e.department_id=d.department_id AND e.job_id=j.job_id AND d.department_name="Sales"
GROUP BY j.job_title
HAVING COUNT(e.employee_id)>1
ORDER BY j.job_title DESC;

-- Question 15
SELECT e.employee_id AS emlpoyee_id, e.first_name AS employee_name, m.employee_id AS manager_id, m.first_name AS manager_name
FROM employees e, employees m
WHERE e.manager_id=m.employee_id;

-- Extra Question
CREATE DATABASE APEX_MIS;
USE APEX_MIS;

CREATE TABLE section(
					section_id int PRIMARY KEY,
                    section_name varchar(20) NOT NULL,
                    classroom_no int(3) NOT NULL
);

CREATE TABLE student(
					roll_no int PRIMARY KEY,
                    student_name varchar(20) NOT NULL,
                    dob date,
                    email varchar(20) NOT NULL UNIQUE,
                    gender char(1) NOT NULL,
                    CHECK(gender IN("m","f","o")),
                    section_id int,
                    FOREIGN KEY(section_id) references section(section_id)
);

-- FOR SECTION
INSERT INTO section VALUES("100", "EFIKA", "404");
INSERT INTO section VALUES("101", "ENUM", "405");
INSERT INTO section VALUES("103", "DEISM", "406");

-- FOR STUDENT
INSERT INTO student VALUES("1", "Aron Aryal", "2001-02-01", "aron.aryal@gmail.com","m","100");
INSERT INTO student VALUES("2", "Arion Awale", "2001-12-07", "arion02@gmail.com","m","100");
INSERT INTO student VALUES("3", "Ason Bajigar", "2002-05-12", "ason98@gmail.com","m","100");

SELECT * FROM STUDENT;



-- lab 3.3
-- no.1
UPDATE employees
SET salary = 1.2*salary
WHERE salary > 10000;

-- no.2
UPDATE employees e, departments d
SET department_name = "Administration"
WHERE d.department_id = e.department_id AND d.department_name="Accountant";

SELECT * FROM employees;
-- no. 3
INSERT INTO employees VALUES ("212", "Arun", "Thapa", "arun.thapa@gmail.com", 
"9841222332", "1994-02-02", (SELECT job_id FROM jobs WHERE job_title="Accountant"), "20000", "101", (SELECT department_id FROM departments WHERE department_name="Finance"));

-- no.4
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id=d.department_id;

-- no.5
-- JOIN 
SELECT e.first_name, e.last_name, c.country_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
JOIN locations l
ON d.location_id=l.location_id
JOIN countries c
ON l.country_id=c.country_id
WHERE c.country_name="United States of America";

-- Sub query
SELECT first_name, last_name
FROM employees
WHERE department_id IN(SELECT department_id FROM departments WHERE location_id IN(SELECT location_id FROM locations WHERE country_id IN(SELECT country_id FROM countries WHERE country_name="United States of America")));


