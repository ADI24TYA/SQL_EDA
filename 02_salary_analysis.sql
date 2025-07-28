
#####################################################  -- Salary Analysis --  #####################################################

-- Current salary of employees (using latest salary)
SELECT emp_no, salary
FROM salaries
WHERE to_date = '9999-01-01';

-- Average salary per job title
SELECT t.title, ROUND(AVG(s.salary), 2) AS avg_salary
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY t.title;

-- Highest salary ever paid
SELECT emp_no, MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no
ORDER BY max_salary DESC
LIMIT 10;

-- Salary growth for a specific employee (example: emp_no = 10001)
SELECT salary, from_date, to_date
FROM salaries
WHERE emp_no = 10001
ORDER BY from_date;

-- Employees earning more than 100K currently
SELECT emp_no, salary
FROM salaries
WHERE to_date = '9999-01-01' AND salary > 100000;

-- Salary distribution: group into buckets
SELECT 
  CASE
    WHEN salary < 40000 THEN 'Low (<40K)'
    WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium (40K–70K)'
    WHEN salary BETWEEN 70001 AND 100000 THEN 'High (70K–100K)'
    ELSE 'Very High (>100K)'
  END AS salary_group,
  COUNT(*) AS count
FROM salaries
WHERE to_date = '9999-01-01'
GROUP BY salary_group;

-- Salary percentile per job title (using window function)
SELECT t.title, t.emp_no, s.salary,
       NTILE(4) OVER (PARTITION BY title ORDER BY salary DESC) AS salary_quartile
FROM titles t
JOIN salaries s ON t.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

