USE sakila;

SELECT * FROM sakila.actor
LIMIT 5;

-- lab-intro-sql
-- 1- Show tables in the database.
SHOW TABLES;

-- 2. Explore tables. (select everything from each table)
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;

-- 3. Select one column from a table. Get film titles.
SELECT title AS 'film title' FROM sakila.film_text;

-- 4. Select one column from a table and alias it. Get languages.
SELECT name AS Language FROM sakila.language;

-- 5. How many stores does the company have? How many employees? which are their names?
SELECT count(store_id) FROM store;


-- lab-sql-2
-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name IN ('Scarlett');

-- 2. Select all the actors with the last name ‘Johansson’.
SELECT * FROM sakila.actor
WHERE last_name IN ('Johansson');

-- 3. How many films (movies) are available for rent?
SELECT count(film_id) FROM film;

-- 4. How many films have been rented?
SELECT count(rental_id) FROM rental;

-- 5. What is the shortest and longest rental period?
SELECT rental_date, return_date FROM sakila.rental
LIMIT 5;

SELECT min(return_date - rental_date) as shortest_rental_period, max(return_date - rental_date) as longest_rental_period FROM sakila.rental;

-- 6. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.
SELECT min(length) AS shortest_duration, max(length) AS longest_duration FROM film;

-- 7. What's the average movie duration?
SELECT ROUND(AVG(length)) as average_duration FROM film;

-- 8. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(FLOOR(ROUND(AVG(length))/60),'h ', MOD(ROUND(AVG(length)),60),'m') AS average_duration_hs_ms FROM film;

-- 9. How many movies longer than 3 hours?
SELECT COUNT(film_id) FROM film
WHERE length > 180;

-- 10. Get the name and email formatted. Example: Mary SMITH - *mary.smith@sakilacustomer.org*.
SELECT CONCAT((left(first_name,1)), SUBSTR(LOWER(first_name),2), ' ',last_name, ' - ' ,LOWER(email)) from customer;

-- 11. What's the length of the longest film title?
SELECT max(LENGTH(title)) AS longest_film_title FROM film;