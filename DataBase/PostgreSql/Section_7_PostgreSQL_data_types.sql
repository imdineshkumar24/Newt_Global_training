SELECT * FROM customers;

--Boolean
CREATE TABLE table_boolean(
	product_id SERIAL PRIMARY KEY,
	values VARCHAR(10) NOT NULL,
	is_available BOOLEAN NOT NULL
)

SELECT * FROM table_boolean;

INSERT INTO table_boolean(values,is_available)
VALUES('TRUE',TRUE),
('FALSE',FALSE),
('true','true'),
('false','false'),
('t','t'),('f','f'),('Yes','Yes'),('No','No'),
('Y','Y'),('N','N'),('1','1'),('0','0')

SELECT * FROM table_boolean
WHERE is_available=true; --PRINT ALL TRUE VALUES

SELECT * FROM table_boolean
WHERE is_available='0'; -- PRINT ALL FALSE VALUES

SELECT * FROM table_boolean
WHERE is_available='T'; --PRINT ALL TRUE VALUES

SELECT * FROM table_boolean
WHERE NOT is_available; -- PRINT ALL FALSE VALUES

SELECT * FROM table_boolean
WHERE is_available; --PRINT ALL TRUE VALUES

ALTER TABLE table_boolean
ALTER COLUMN is_available
SET DEFAULT FALSE --SET default value is false


INSERT INTO table_boolean(values)
VALUES('14') RETURNING *



SELECT CAST('Dinesh' AS character(10)) AS "Name"
--OUTPUT: "Dinesh    "

SELECT 'Dinesh'::CHAR(10) AS "Name" --OUTPUT: "Dinesh    "


SELECT CAST('Dinesh' AS VARCHAR(10)) AS "Name"
--OUTPUT: "Dinesh"

SELECT 'Dinesh is playing football'::VARCHAR(10) AS "Name"
--OUTPUT: "Dinesh is "


SELECT 'Artificial intelligence (AI), in its broadest sense, is intelligence exhibited by machines, particularly computer systems. It is a field of research in computer science that develops and studies methods and software that enable machines to perceive their environment and use learning and intelligence to take actions that maximize their chances of achieving defined
goals.[1] Such machines may be called AIs.' ::TEXT AS "Text"


SELECT 'Dinesh' :: TEXT AS "Name"
--OUTPUT: "Dinesh"


SELECT 32767::SMALLINT AS "Small Int" --OUTPUT: 32767
SELECT 32768::SMALLINT AS "Small Int" --OUTPUT: ERROR:  smallint out of range 

SELECT 2147483647::INT AS "Int" --OUTPUT: 2147483647
SELECT 2147483648::INT AS "Int" --OUTPUT: ERROR:  integer out of range 

SELECT 9223372036854775807::BIGINT AS "Big Int" --OUTPUT: 9223372036854775807
SELECT 9223372036854775808::BIGINT AS "Big Int" --OUTPUT: ERROR:  bigint out of range 


CREATE TABLE table_numbers(
	col_numeric NUMERIC(20,5),
	col_real REAL,
	col_double DOUBLE PRECISION
)

SELECT * FROM table_numbers;

INSERT INTO table_numbers( col_numeric,col_real,col_double)
VALUES(.9,.9,.9),(3.1456789,8.37529,9.87120),
(5.9128945832,9.823074567,7.356823643)


CREATE TABLE employee(
	id SERIAL PRIMARY KEY,
	employee_name VARCHAR(100) NOT NULL,
	hire_date DATE NOT NULL,
	add_date DATE DEFAULT CURRENT_DATE
)

SELECT * FROM employee


INSERT INTO employee(employee_name,hire_date)
VALUES('Dinesh','2025-02-02'),
('Ramesh','2025-02-03'),
('Jai','2025-01-25')

SELECT CURRENT_DATE --show the today's date
SELECT NOW() --show current date and time


CREATE TABLE table_time(
	id SERIAl PRIMARY KEY,
	class_name VARCHAR(100) NOT NULL,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL
)