SELECT 
	c.customer_id,
	COUNT(r.rental_id) AS num_of_rentals
FROM rental AS r
JOIN customer AS c
	ON r.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY num_of_rentals DESC;