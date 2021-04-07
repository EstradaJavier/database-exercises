USE employees;

# Write a query that shows each
# department along with the name of the current manager
# for that department.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
order by dept_name DESC;

# Find the name of ALL DEPARTMENTS currently MANAGED by WOMEN.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS Full_name
FROM employees as e
JOIN dept_manager as dm
ON dm.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER by dept_name DESC;


SELECT t.title AS Title, COUNT(t.emp_no) AS Count
FROM titles AS t
JOIN dept_emp as de
ON t.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd009'
AND t.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY t.title;


SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, salary
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
         JOIN salaries s
              ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
ORDER BY dept_name;

show databases;