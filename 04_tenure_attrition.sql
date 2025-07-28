
#####################################################  -- Tenure Attrition Analysis --  #####################################################

-- Employee tenure (in years)
SELECT emp_no, DATEDIFF(CURDATE(), hire_date)/365 AS tenure_years
FROM employees
ORDER BY tenure_years DESC
LIMIT 10;

-- Average tenure per title
SELECT t.title, ROUND(AVG(DATEDIFF(CURDATE(), e.hire_date)/365), 2) AS avg_tenure
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
GROUP BY t.title;

-- Employees who left the company (salaries.to_date != '9999-01-01')
SELECT COUNT(DISTINCT emp_no) AS former_employees
FROM salaries
WHERE to_date != '9999-01-01';

-- Employees who stayed for less than 1 year
SELECT emp_no, DATEDIFF(to_date, from_date)/365 AS tenure_years
FROM dept_emp
WHERE DATEDIFF(to_date, from_date)/365 < 1;

-- Yearly attrition trend (based on employees whose latest salary record ended)
SELECT YEAR(to_date) AS exit_year, COUNT(*) AS num_exits
FROM salaries
WHERE to_date != '9999-01-01'
GROUP BY exit_year
ORDER BY exit_year;

-- Longest tenured employees still in the company
SELECT emp_no, hire_date, DATEDIFF(CURDATE(), hire_date)/365 AS tenure_years
FROM employees
ORDER BY tenure_years DESC
LIMIT 10;

-- Average tenure difference between male and female employees
SELECT gender, ROUND(AVG(DATEDIFF(CURDATE(), hire_date)/365), 2) AS avg_tenure
FROM employees
GROUP BY gender;
