## --select/use employees database
use employees;

#####################################################  -- Basic Exploration of Data --  #####################################################
						
-- Tables in employees database
show tables from employees;

-- Table description
describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;


-- Total number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Number of male and female employees
SELECT gender, COUNT(*) AS count
FROM employees
GROUP BY gender;

-- Oldest and youngest employee (based on birth_date)
SELECT MIN(birth_date) AS youngest_dob, MAX(birth_date) AS oldest_dob FROM employees;

-- Employees hired each year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- Count of employees by birth decade
SELECT CONCAT(FLOOR(YEAR(birth_date)/10)*10, 's') AS birth_decade, COUNT(*) AS count
FROM employees
GROUP BY birth_decade
ORDER BY birth_decade;

-- Distribution of employees by hire year and gender
SELECT YEAR(hire_date) AS hire_year, gender, COUNT(*) AS hires
FROM employees
GROUP BY hire_year, gender
ORDER BY hire_year;

-- First 10 employees hired
SELECT emp_no, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date
LIMIT 10;

-- Last 10 employees hired
SELECT emp_no, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 10;

