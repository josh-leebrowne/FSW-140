SELECT first_name, last_name FROM customer WHERE status = 'Active'
UNION
SELECT first_name, last_name FROM employees WHERE emp_status = 'Current' 
ORDER BY record_type, first_name, last_name;

-- Join combines data into separate columns
-- Union combines data into separate rows

SELECT Emp.emp_id, EMP.first_name, EMP.last_name, CUST.customer_id, CUST.first_name, CUST.last_name
FROM employee EMP INNER JOIN customer CUST
ON EMP.first_name = CUST.first_name AND EMP.last_name = CUST.last_name;