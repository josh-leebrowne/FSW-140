CREATE DATABASE bobross;

USE bobross;

SELECT * FROM elementsbyepisode;
SELECT episode FROM elementsbyepisode;
SELECT title FROM elementsbyepisode;
SELECT WINTER, TITLE, EPISODE FROM elementsbyepisode;

-- CREATE
CREATE TABLE newtable(
	EPISODE VARCHAR(50),
    TITLE VARCHAR(50),
    WINTER INT(1)
);
-- Creates a new table with 3 columns, A two letter column, an up to 50 letter column and an up to 5 digit column

INSERT INTO newtable 
(TITLE, EPISODE, WINTER)
VALUES("A WALK IN THE WOODS", "S01E01", 0);

INSERT INTO newtable 
(TITLE, EPISODE, WINTER)
VALUES("MT. MCKINLEY", "S01E02", 1);

INSERT INTO newtable 
(TITLE, EPISODE, WINTER)
VALUES("EBONY SUNSET", "S01E03", 1);

SELECT winter, title FROM newtable;

-- SET
SELECT title, winter FROM elementsbyepisode WHERE WINTER = 1
UNION
SELECT title, winter FROM newtable WHERE WINTER = 0
ORDER BY winter ASC;
-- This statement selects the only non winter episode from the new table, and joins it with the tables who are listed winter in the orginal table

-- Subquery 
SELECT title, episode, (SELECT episode FROM newtable Newt WHERE Elem.episode = Newt.episode) AS 'Episode'
FROM  elementsbyepisode Elem;
-- This query grabs the title and episode from each table and matches them to each other

-- Order of Operations
SELECT title, episode FROM elementsbyepisode WHERE sun LIKE 1 ORDER BY episode ASC;

-- This query selects all of the titles and episode from elementsbyepisode that have a sun in them and orders them by episode ascending order

-- Foreign Keys
SELECT Newt.* FROM newtable Newt JOIN elementsbyepisode Elem
ON (Elem.title = Newt.title)
WHERE Newt.winter > 0;
-- Why doesn't this work?

-- Joins
SELECT DISTINCT Elem.title, Elem.winter, Newt.title, Newt.winter FROM elementsbyepisode Elem
JOIN newtable Newt WHERE Elem.title LIKE '%EBONY%' AND Newt.title LIKE '%EBONY%' LIMIT 2;
-- This query selects the title and whether or not it is winter from each table and joins them only if their title has a name similar to Ebony





