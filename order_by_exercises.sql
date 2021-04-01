Use employees;
SELECT *
From employees
Where first_name IN ('Irena', 'Vidya')
  AND last_name IN ('Reutenauer', 'Demeyer')
ORDER BY last_name ASC,
         first_name DESC ;
SELECT *
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;
SELECT *
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
Select *
From employees
WHERE last_name Like '%q%'AND last_name NOT LIKE '%qu%';