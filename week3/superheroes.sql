USE avengers;
USE understanders;

-- Query
ALTER TABLE understanders ADD new_superheros VARCHAR(50);

UPDATE understanders  SET new_superheros = 
	CASE 
		WHEN (rand() < 0.5) THEN 'Wants to join'
        ELSE 'Does not want to join'
        END;

ALTER TABLE understanders ADD fav_superheros VARCHAR(50);
UPDATE understanders SET fav_superheros = 
	CASE 
		WHEN (rand() < 0.3) THEN 'Tony Stark'
        WHEN (rand() > 0.3) THEN 'Victor Shade'
        ElSE 'Bruce Banner'
	END;
    
SELECT name FROM avengers WHERE appearances < 150 AND gender LIKE 'male' AND fullAvengersIntro ORDER BY name ASC;


-- Columns: 1
-- Expected Row Count: 18

SELECT * FROM avengers



