USE sakila;
-- Consulta 1

SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM customer JOIN address
ON customer.address_id = address.address_id
WHERE address.city_id = 312;

-- Consulta 2

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.category_id = 5;

-- Consulta 3

SELECT actor.actor_id, CONCAT_WS(" ",actor.first_name, actor.last_name) as full_name, film.title, film.description, film.release_year
FROM film JOIN film_actor 
ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5;

-- Consulta 4
SELECT customer.first_name, customer.last_name, customer.email, address.address, store.store_id, city.city_id
FROM customer JOIN store ON customer.store_id = store.store_id
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city.city_id IN (1, 42, 312, 459) AND store.store_id = 1;

-- Consulta 5
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film.rating = 'G' AND film_actor.actor_id = 15 AND film.special_features LIKE '%Behind the Scenes%';

-- Consulta 6
SELECT film.film_id, film.title, film_actor.actor_id, CONCAT_WS(" ",actor.first_name, actor.last_name) as full_name
FROM film JOIN film_actor 
ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id = 369;

-- Consulta 7
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Drama' AND film.rental_rate = 2.99;

-- Consulta 8
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, 
category.name, actor.first_name, actor.last_name
FROM film JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'Action' AND CONCAT_WS(" ",actor.first_name, actor.last_name) = 'SANDRA KILMER';