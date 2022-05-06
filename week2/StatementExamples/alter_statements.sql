USE hr;

ALTER TABLE country_new RENAME country_list;

ALTER TABLE locations ADD region_id INT;

ALTER TABLE locations ADD ID INT FIRST;

ALTER TABLE locations DROP region_id; -- does not work if last column left in table

ALTER TABLE locations ADD region_id INT AFTER state_province;

ALTER TABLE locations MODIFY country_id VARCHAR(5);
-- modify definition or change clause

-- ALTER TABLE locations DROP state_province ADD state varchar(25) AFTER city;
ALTER TABLE locations CHANGE state_province state varchar(25);

ALTER TABLE locations DROP PRIMARY KEY;

ALTER TABLE locations ADD PRIMARY KEY(location_id, country_id);

SHOW COLUMNS FROM locations;

DESCRIBE locations;
