
#####################################################  -- Bonus Insights --  #####################################################

-- Most promoted employees (most number of title changes)
SELECT emp_no, COUNT(DISTINCT title) AS title_changes
FROM titles
GROUP BY emp_no
ORDER BY title_changes DESC
LIMIT 10;

-- Employees with most department transfers
SELECT emp_no, COUNT(DISTINCT dept_no) AS dept_changes
FROM dept_emp
GROUP BY emp_no
ORDER BY dept_changes DESC
LIMIT 10;

-- Gender pay gap (if applicable)
SELECT gender, ROUND(AVG(salary), 2) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY gender;

-- Employees who have held more than 3 unique titles
SELECT emp_no, COUNT(DISTINCT title) AS num_titles
FROM titles
GROUP BY emp_no
HAVING num_titles > 3;

-- Employees who received more than 4 salary changes
SELECT emp_no, COUNT(*) AS salary_changes
FROM salaries
GROUP BY emp_no
HAVING salary_changes > 4;

-- Average salary progression for a specific title
SELECT title, AVG(salary) AS avg_salary
FROM titles t
JOIN salaries s ON t.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY title
ORDER BY avg_salary DESC;

-- Most common job title per department
SELECT d.dept_name, t.title, COUNT(*) AS count
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN titles t ON de.emp_no = t.emp_no
GROUP BY d.dept_name, t.title
ORDER BY d.dept_name, count DESC;
