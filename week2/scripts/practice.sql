USE hr;

SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;

SELECT manager_id, MIN(salary) FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id ORDER BY MIN(salary) DESC;

SELECT job_id, ROUND(AVG(salary),0) AS 'AVG Salary' FROM employees WHERE job_id <> 'IT_PROG' GROUP BY job_id;

SELECT job_id, MAX(salary) FROM employees GROUP BY job_id HAVING MAX(salary) >= 4000;

SELECT department_id, AVG(salary), COUNT(*) FROM employees GROUP BY department_id HAVING COUNT(*) > 10;