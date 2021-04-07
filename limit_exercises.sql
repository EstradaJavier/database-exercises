USE employees;

SELECT DISTINCT last_name as LName, first_name AS FName
FROM employees
ORDER By last_name
    Limit 10;

