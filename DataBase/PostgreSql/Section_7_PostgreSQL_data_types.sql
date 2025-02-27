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

SELECT * FROM table_time;

INSERT INTO table_time (class_name,start_time,end_time)
VALUES('MATH','08:00:00','09:00:00'),
('PHYSICS','09:00:00','10:00:00')


SELECT CURRENT_TIME

--precision
SELECT CURRENT_TIME(4) --output: "23:27:06.655300+05:30"
SELECT CURRENT_TIME(2) --output: "23:28:10.470000+05:30"

SELECT CURRENT_TIME,LOCALTIME

SELECT LOCALTIME,LOCALTIME(2)

--arithimetic

SELECT time '12:00'-time '4:00' as Result

SELECT CURRENT_TIME,CURRENT_TIME+ time'1:00' as RESULT
SELECT CURRENT_TIME,
CURRENT_TIME+ interval'10 hours' as RESULT

--timezone
show TIMEZONE --output: "Asia/Calcutta"

CREATE TABLE time_zone(
	tz TIMESTAMP,
	tztz TIMESTAMPTZ
)
SELECT * FROM time_zone

INSERT INTO time_zone(tz,tztz)
VALUES('2025-02-02 08:09:00-08','2025-02-02 08:09:00-08')

SET TIMEZONE='America/New_york'
SET TIMEZONE='Asia/Calcutta'

SELECT TIMEOFDAY()

--uuid

CREATE EXTENSION "uuid-ossp"

SELECT uuid_generate_v1()
--output: "a4f39742-f470-11ef-a1ec-33677504e24f"
--output: "c0d3b014-f470-11ef-a1ed-4bc8f4269dd6"

SELECT uuid_generate_v4()
--output: "25e67c70-2b7e-4f91-b696-12623845c028"

CREATE TABlE table_uuid(
	id UUID DEFAULT uuid_generate_v4(),
	name VARCHAR(100) not null
)

SELECT * FROM table_uuid

INSERT INTO table_uuid(name)
VALUEs('eraser'),('sharpner')


--Array

SELECT ARRAY['Dinesh','Rajesh']
CREATE TABLE table_array(
	id SERIAL,
	name VARCHAR(100),
	phone TEXT[]
)

SELECT * FROM table_array

INSERT INTO table_array(name,phone)
VALUES('Dinesh',ARRAY['8954','9876']),
('Suganraj',ARRAY['8874','9865'])

SELECT name,phone [1] FROM table_array

SELECT 
	name FROM table_array
WHERE phone[1]='8874'

--hstore key-value pair
CREATE EXTENSION IF NOT EXISTS hstore



CREATE TABLE table_hstore(
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	book_info hstore
)
SELECT * FROM table_hstore

INSERT INTO table_hstore(title,book_info)
VALUES( 'Title 1',
	' 
		"publisher"=> "john publisher",
		"cost"=> "100",
	'
)

SELECT book_info->'publisher' as "Publisher"
FROM table_hstore


--json
CREATE TABLE table_json(
	id SERIAL PRIMARY KEY,
	docs JSON
)

SELECT * FROM table_json

INSERT INTO table_json(docs) VALUES
('[1,2,3,4,5,6]'),('[2,3,4,5,6,7]'),
('{"key":"value"}')

SELECT * from table_json
where docs @>'2' 
--ERROR:  operator does not exist: json @> unknown

--Network Address

CREATE TABLE table_netadr(
	id SERIAL PRIMARY KEY,
	ip INET
)

SELECT * FROM table_netadr


INSERT INTO table_netadr(ip) VALUES
('192.25.25.00'),
('255.255.255.26'),
('193.56.56.34')


SELECT 
	ip,set_masklen(ip,24) as inet_24,
	set_masklen(ip::cidr,24) as cidr_24
from table_netadr

