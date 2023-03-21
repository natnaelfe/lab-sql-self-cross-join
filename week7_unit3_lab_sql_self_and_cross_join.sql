USE sakila;

# 1 . Get all pairs of actors that worked together.
SELECT a.actor_id, b.actor_id, c.title
FROM film_actor a, film_actor b
JOIN film c ON b.film_id = c.film_id
WHERE a.actor_id = b.actor_id AND a.film_id = b.film_id
ORDER BY a.film_id; # result: 5462 rows

# 2. Get all pairs of customers that have rented the same film more than 3 times.
SELECT c.film_id, a.customer_id AS customer_1, b.customer_id AS Customer_2, COUNT(*) AS Num_rentals
FROM rental a
JOIN rental b
ON a.inventory_id = b.inventory_id and a.customer_id < b.customer_id
JOIN inventory c
ON b.inventory_id = c.inventory_id
GROUP BY c.film_id, a.customer_id, b.customer_id
HAVING COUNT(*) >= 2; # result: only row with 2 rentals!


# 3. Get all possible pairs of actors and films.
SELECT distinct a.actor_id, f.film_id
FROM actor a
CROSS JOIN film f
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id AND f.film_id = fa.film_id
WHERE fa.actor_id IS NOT NULL; # result: 5462 rows


