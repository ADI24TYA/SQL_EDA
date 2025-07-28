
#####################################################  -- Department Analysis --  #####################################################

-- Number of employees per department
SELECT d.dept_name, COUNT(*) AS num_employees
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY num_employees DESC;

-- Average salary per department
SELECT d.dept_name, ROUND(AVG(s.salary), 2) AS avg_salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_name;

-- Departments with most managers
SELECT d.dept_name, COUNT(*) AS num_managers
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY num_managers DESC;

-- Department with highest average tenure
SELECT d.dept_name, ROUND(AVG(DATEDIFF(CURDATE(), e.hire_date)/365), 2) AS avg_tenure
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY avg_tenure DESC;

-- Salary gap between departments (min vs max)
SELECT d.dept_name, MIN(s.salary) AS min_salary, MAX(s.salary) AS max_salary,
       (MAX(s.salary) - MIN(s.salary)) AS salary_range
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_name;

-- Average number of years employees stay in each department
SELECT d.dept_name, ROUND(AVG(DATEDIFF(de.to_date, de.from_date)/365), 2) AS avg_years
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name;
