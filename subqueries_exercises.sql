use employees;

#1 - Find all the employees with the same hire date as employee 101010
#    using a subquery. --- 69 Rows

SELECT emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
);

#2 - Find all the titles held by all employees with the first name Aamod.
#    314 total titles, 6 unique titles

SELECT title, COUNT(title)
FROM titles
WHERE emp_no IN (SELECT emp_no
                 FROM employees
                 WHERE first_name = 'Aamod')
group by title

limit 100;



#3 - Find all the current department managers that are female.

SELECT first_name, last_name
FROM employees e
WHERE e.gender = 'F'

SELECT first_name, last_name
FROM employees as e
         JOIN salaries s
              ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 1;

