USE hr;

-- Write a query to find (first_name, last_name) and the salary of employees who have a higher salary than the employee whose last name is 'Bull'
SELECT first_name, last_name, salary FROM employees WHERE salary > (SELECT salary FROM employees WHERE last_name = 'bull');

-- Write a query to find the name (first_name, last_name) and the salary of employees who earn more than the average salary and works in the IT department
SELECT first_name, last_name FROM employees WHERE department_id IN
	(SELECT department_id FROM departments WHERE department_name LIKE '%IT%');

-- Write a query to find the name (first_name, last_name) and salary of the employees who earn the same salary as the minimum salary for all departments
SELECT first_name, last_name FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);

-- Write a query to display the employee ID, first name, last name, and department of all employees
SELECT employee_ID, first_name, last_name, (SELECT department_name FROM departments Dept WHERE Emps.department_id = Dept.department_id) AS 'Department'
FROM  employees Emps;