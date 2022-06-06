USE hr;

-- Write a query to find the name (first_name, last_name), dept ID, and name of all employees
SELECT first_name, last_name, department_id, department_name
FROM employees JOIN departments USING (department_id);

-- Write a query to find the name (first_name, last_name), job, dept ID, and name of employees who work in London
SELECT Emp.first_name, Emp.last_name, Emp.job_id, Depts.department_id, Depts.department_name FROM employees Emp
	JOIN departments Depts ON (Emp.department_id = Depts.department_id)
    JOIN locations Loc ON (Depts.location_id = Loc.location_id)
WHERE Loc.city = "London";

-- Write a query to find the employee ID, name (last_name) along with their manager_id and name (last_name)alter
SELECT Emp.employee_id AS 'Employee ID', Emp.last_name AS 'Employee Last Name', Mgr.employee_id AS 'Manager ID', Mgr.last_name AS 'Manager Last Name'
FROM employees Emp JOIN employees Mgr
ON (Emp.manager_id = Mgr.employee_id); 

-- Write a query to get the department name and number of employees in the department
SELECT department_name AS 'Department Name', COUNT(*) AS  '# of Employees' FROM departments Depts
	INNER JOIN employees Emps ON Depts.department_id = Emps.department_id
    GROUP BY Depts.department_id, Depts.department_name
    ORDER BY Depts.department_name;

-- Write a query to display department ID and department name and first name of manager
SELECT Depts.department_id, Depts.department_name, Depts.manager_id, Emps.first_name
FROM departments Depts INNER JOIN employees Emps
ON(Depts.manager_id = Emps.employee_id);

-- Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary
SELECT JobHis.* FROM job_history JobHis JOIN employees Emps
ON (JobHis.employee_id = Emps.employee_id)
WHERE Emps.salary > 10000;


-- Write a query to display department name, name (first_name, last_name), hire date and salary of the manager for all managers whose work experience in more than 15 years
SELECT first_name, last_name, hire_date, salary, ROUND((DATEDIFF(now(), hire_date))/365,0) AS 'Years of Experience'
FROM employees Emps JOIN departments Depts
ON(Depts.manager_id = Emps.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365 > 15