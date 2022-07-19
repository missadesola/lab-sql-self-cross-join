-- Get all pairs of actors that worked together.
SELECT fa1.actor_id AS actor1, fa1.film_id AS film, fa2.actor_id AS actor2
FROM film_actor AS fa1
JOIN film_actor AS fa2
ON fa1.film_id=fa2.film_id
AND fa1.actor_id>fa2.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.

WITH cte AS (
SELECT cus.customer_id AS customer1, inv.film_id AS film, COUNT(r.rental_id) AS times_rented
FROM customer AS cus
JOIN rental AS r
ON r.customer_id=cus.customer_id
JOIN inventory AS inv
ON inv.inventory_id=r.inventory_id
GROUP BY cus.customer_id ,inv.film_id
HAVING COUNT(r.rental_id)>1)
SELECT cte1.film, cte1.customer1 AS c1, cte1.times_rented, cte2.customer1 AS c2, cte2.times_rented
FROM cte AS cte1
JOIN cte AS cte2
ON cte1.film = cte2.film
AND cte1.customer1 > cte2.customer1;

-- Get all possible pairs of actors and films.
SELECT a.first_name AS afirst_name, a.last_name AS last_name, f.title AS title
FROM actor AS a
JOIN film_actor  AS fa
ON fa.actor_id = a.actor_id
JOIN film AS f
ON f.film_id = fa.film_id;