SELECT 
	film.rating AS rating,
	COUNT(film.title),
	ROUND(AVG(film.length / film.rental_rate),2) AS min_per_dollar
FROM film
GROUP BY film.rating;