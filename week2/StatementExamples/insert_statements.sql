USE hr;

INSERT INTO countries(country_id, country_name) VALUES ('GR', 'Greece');

INSERT INTO countries(country_id, country_name, region_id) VALUES ('SW', 'Sweden', NULL);

INSERT INTO countries(country_id, country_name, region_id) VALUES
('AS', 'Austria', 1001),
('CR', 'Croatia', 1002),
('CU', 'CUBA', 1003);

CREATE TABLE IF NOT EXISTS country_new
AS SELECT * FROM countries;

INSERT INTO countries_new SELECT * FROM countries