SELECT * FROM customer;

SELECT first_name FROM customer;

SELECT first_name,last_name FROM customer;

SELECT first_name AS firstname FROM customer;

SELECT 
	first_name AS "First Name",
	phone_no AS "Phone NO"
FROM customer;

--Error will arise in single quotes
SELECT first_name AS 'first name' FROM customer; 


SELECT 
	first_name ||' '|| last_name AS "Full Name"
FROM CUSTOMER;


SELECT 10/2

