use employees;

SELECT CONCAT(emp_no, ' ', first_name, ' ', last_name) AS full_name, birth_date AS DOB
FROM employees AS emp
    LIMIT 10;