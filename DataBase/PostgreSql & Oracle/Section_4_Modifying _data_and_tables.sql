
CREATE TABLE customer(
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100),
phone_no INT,
age INT
)

SELECT * FROM customer;

INSERT INTO  customer(first_name,last_name,phone_no,age)
VALUES ('DINESH','KUMAR',8546,22)

INSERT INTO  customer(first_name,last_name,phone_no,age)
VALUES ('DEEPAK','KUMAR',8836,25),
('ARUN','VIGNESH',8538,21),
('NITHISH','K',9846,22),
('MOHAN','R',7526,23),
('RASIL','RISAM',8546,22)

INSERT INTO  customer(first_name,last_name,phone_no,age)
VALUES ('DANNY''S','VAN',8546,22)

INSERT INTO  customer(first_name)
VALUES ('GOWTHAM') RETURNING FIRST_NAME

UPDATE CUSTOMER 
SET PHONE_NO=9348 
WHERE FIRST_NAME='RASIL' RETURNING *;

UPDATE CUSTOMER 
SET is_enable='OK' RETURNING *;

DELETE FROM customer WHERE first_name='RAHUL';

ALTER TABLE customer ADD CONSTRAINT unique_first_name UNIQUE (first_name);

INSERT INTO  customer(first_name)
VALUES ('GOWTHAM') 
ON CONFLICT(first_name)
DO 
	UPDATE SET 
	 first_name=EXCLUDED.first_name || '2';