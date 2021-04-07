Use employees;

SELECT CONCAT(first_name, ' ', last_name) AS 'full_name'
From employees
Where last_name IN '%E'
  AND last_name IN 'E%'
ORDER BY emp_no;