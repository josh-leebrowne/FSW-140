USE hr;

SELECT first_name AS "First Name", last_name AS "Last Name" FROM employees;

SELECT * FROM employees ORDER BY first_name DESC;

SELECT first_name, last_name, LENGTH(first_name) + LENGTH(last_name) AS "Length of Names" FROM employees;

SELECT employee_id, first_name, last_name FROM employees LIMIT 10;

SELECT first_name, last_name, salary FROM employees WHERE salary NOT BETWEEN 10000 AND 15000;

SELECT first_name, last_name, department_id FROM employees WHERE department_id IN(30, 100) ORDER BY department_id ASC;

SELECT first_name, last_name, salary, department_id FROM employees WHERE salary NOT BETWEEN 10000 AND 15000 AND department_id IN(30, 100);

SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date) LIKE '1987%';

SELECT first_name, last_name, salary, job_id FROM employees WHERE job_id IN('SH_CLERK', 'IT_PROG') AND salary NOT IN(4500, 10000, 15000);