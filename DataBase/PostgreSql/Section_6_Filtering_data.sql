SELECT * FROM movies;


SELECT * FROM movies 
	WHERE movie_length>110 AND age_certificate='18';


SELECT movie_name,movie_lang,age_certificate
FROM movies
	WHERE movie_lang='English' OR age_certificate='18'
	ORDER BY movie_name;


SELECT * 
FROM movies
	WHERE (movie_lang='English' OR movie_lang='Chinese')
	AND age_certificate='15';

SELECT (2+1)*3;

--This query error will arise because of alias
SELECT 
	first_name,
	last_name AS surname
FROM actors
	WHERE surname='Braga';


--Order by excution
SELECT * 
FROM movies
	WHERE movie_lang='English'
	ORDER BY movie_name;

SELECT * FROM movies
WHERE movie_length>100 ORDER BY movie_length asc;

SELECT * FROM movies
WHERE movie_length<120 ORDER BY movie_length ASC;

SELECT * FROM movies
WHERE release_date>='1964-08-29' ORDER BY release_date ASC;

SELECT * FROM movies
WHERE release_date<='2011-06-03' ORDER BY release_date ASC;

SELECT * FROM movies
WHERE age_certificate<>'18';

--Check with alphabetic order
SELECT * 
FROM movies
WHERE movie_lang>'English';


SELECT * 
FROM movies
WHERE movie_lang<='Japanese';

--Integer value can be in quotes
SELECT * FROM movies
WHERE movie_length = '120';

--LIMIT
SELECT * FROM movies
ORDER BY movie_length DESC LIMIT 10;


SELECT * FROM actors
WHERE gender='M'
ORDER BY dob ASC LIMIT 5;


SELECT * FROM movie_revenues
ORDER BY revenue_domestic DESC NULLS LAST LIMIT  5;

--Next 4 Top 5 movies in the table usIng offset
SELECT * FROM movies
ORDER BY movie_id LIMIT 5 OFFSET 4;

--FETCH
SELECT * FROM movies ORDER BY movie_length DESC
FETCH FIRST 5 ROWS ONLY

SELECT * FROM actors
WHERE gender='F' ORDER BY DOB DESC OFFSET 2
FETCH FIRST 5 ROW ONLY; 

SELECT * FROM movies
WHERE movie_lang IN ('English','Chinese','Japanese')
ORDER BY movie_name;

SELECT * FROM movies
WHERE age_certificate NOT IN('18') LIMIT 5;

--BETWEEN
SELECT * FROM directors
WHERE DOB BETWEEN '1970-01-01' AND '1980-12-31'
ORDER BY dob;


SELECT * FROM movies
WHERE movie_length
NOT BETWEEN '100' AND '120'  
ORDER BY movie_length;

--LIKE
SELECT * FROM movies
WHERE movie_name LIKE '%of%' ORDER BY movie_lang


SELECT 'Hello' LIKE 'H%' --True
SELECT 'Hello' LIKE 'h%' --False

SELECT 'Hello' LIKE '%ll%' --True
SELECT 'Hello' LIKE '__llo' --True
SELECT 'Hello' LIKE '_ll_' --False

--ILIKE Case insensitive
SELECT 'Hello' ILIKE 'hEL%' --True
SELECT 'Hello' LIKE 'hEL%' --False 

SELECT * FROM movies 
WHERE movie_name ILIKE 'the%' ORDER BY movie_name

SELECT * FROM movies 
WHERE movie_name ILIKE '%The%' ORDER BY movie_name

 
SELECT * FROM actors ORDER BY last_name

SELECT * FROM actors 
WHERE dob IS NULL

SELECT * FROM actors 
WHERE dob IS NOT NULL AND last_name IS NOT NULL

SELECT * FROM movie_revenues
ORDER BY revenue_domestic


SELECT * FROM movie_revenues
WHERE revenue_domestic IS NULL 
AND revenue_international IS NULL


--Concatenation
SELECT CONCAT(first_name, ' ',last_name) AS "Full Name"
FROM actors

SELECT 'Dinesh' || 'Kumar'
SELECT 'Dinesh' ||' '|| 'Kumar' AS "NAME"

SELECT 
CONCAT_WS('@',first_name,last_name,dob) AS "User Name"
FROM actors

SELECT 
first_name || last_name || DOB --IF ANY VALUE IS NULL , IT WILL BE TOTATLLY NULL
FROM actors;

SELECT 
	CONCAT(first_name,last_name,DOB) 
FROM actors;

SELECT 
	revenue_domestic,
	revenue_international,
	CONCAT_WS(' + ',revenue_domestic,revenue_international)
FROM movie_revenues --So it ignore the NULL values

