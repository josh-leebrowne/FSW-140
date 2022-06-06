USE hr;

-- Write a user defined function that calculate years of experience each employee has in the organization

DELIMITER $$
CREATE FUNCTION YearsOfExperience(hire_date DATE)
RETURNS INT 
DETERMINISTIC 

BEGIN
	-- Calculate the difference between TODAY and the hire data provided as input
    DECLARE YrsExp INT;
    SET YrsExp = 0;
    
    SET YrsExp =  DATEDIFF(now(), hire_date) / 365;
    RETURN YrsExp;
END; //
DELIMITER;

DROP FUNCTION YearsOfExperience;

SELECT first_name, last_name, hire_date, salary, YearsOfExperience(hire_date) FROM employees;