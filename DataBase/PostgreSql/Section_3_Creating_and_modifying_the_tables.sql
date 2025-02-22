--creating a actors table

CREATE TABLE actors (
actor_id SERIAL PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100) NOT NULL,
gender VARCHAR(1),
dob DATE
add_date DATE,
update_date DATE
);
SELECT * FROM actors;


--creating a directors table

CREATE TABLE directors (
director_id SERIAL PRIMARY KEY,
first_name VARCHAR (100),
last_name VARCHAR(100),
dob DATE,
nationality VARCHAR(20),
add_date DATE,
update_date DATE
);

SELECT * FROM directors;


--creating a movies table

CREATE TABLE movies (
movie_id SERIAL PRIMARY KEY,
movie_name VARCHAR(100) NOT NULL,
movie_length INT,
movie_lang VARCHAR(20),
age_certificate VARCHAR(10),
release_date DATE,
director_id INT REFERENCES directors (director_id)
);

SELECT * FROM movies;

--creating a movie_revenues

CREATE TABLE movie_revenues (
revenue_id SERIAL PRIMARY KEY,
movie_id INT REFERENCES movies (movie_id),
revenue_domestic NUMERIC (10,2),
revenue_international NUMERIC (10,2)
);

SELECT * FROM movie_revenues;

--creating a movie_actors table

CREATE TABLE movie_actors (
movie_id INT REFERENCES movies (movie_id),
actor_id INT REFERENCES actors (actor_id),
PRIMARY KEY (movie_id,actor_id)
);

SELECT * FROM movie_actors;