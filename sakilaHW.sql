Use rgw3wgs;
SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'ACADEMY DINOSAUR';

SELECT category.name AS category_name, COUNT(film.film_id) AS film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category_name;



SELECT film.rating, AVG(rental.return_date - rental.rental_date) AS avg_rental_duration
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.rating;



SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS rental_count
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id;



SELECT store.store_id, COUNT(rental.rental_id) AS rental_count
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN rental ON staff.staff_id = rental.staff_id
GROUP BY store.store_id
ORDER BY rental_count DESC
LIMIT 1;



SELECT category.name AS category_name, COUNT(rental.rental_id) AS rental_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category_name
ORDER BY rental_count DESC
LIMIT 1;


SELECT category.name AS category_name, AVG(film.rental_rate) AS avg_rental_rate
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category_name;




SELECT film.title, MAX(rental.return_date) AS last_rental_date
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title;



SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, SUM(payment.amount) AS total_spending
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;



SELECT language.name AS language, AVG(film.length) AS avg_length
FROM language
JOIN film ON language.language_id = film.language_id
GROUP BY language.name;
