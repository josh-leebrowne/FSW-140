USE hr;

-- Write a query to get the total salaries payable to employees
SELECT SUM(salary) FROM employees;

-- Write a query to get the maximum and minimum salary from employees table
SELECT MIN(salary), MAX(salary) FROM employees;

-- Write a query to get the average salary and number of employees in the employees table
SELECT AVG(salary), COUNT(*) FROM employees;

-- Write a query to get the number of designations available in the employees table
SELECT COUNT(DISTINCT job_id) FROM employees;

-- Write a query to get the first 3 characters of first name from the employees table
SELECT first_name, SUBSTRING(first_name, 1, 3) AS 'First 3' FROM employees;

-- Write a query to get the name of all the employees on the employees table
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name' FROM employees;

-- Write a query to get the highest, lowest, sum, and average salary of all employees
SELECT MIN(salary) AS 'Minimum', MAX(salary) AS 'Maximum', SUM(salary) AS 'Sum', AVG(salary) AS 'Average' FROM employees;

-- Write a query to get the difference between the highest and lowest salaries
SELECT MAX(salary) - MIN(salary) AS 'Difference' FROM employees;