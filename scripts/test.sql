SELECT 
	film.rating AS Rating,
	ROUND(AVG(film.rental_rate),2) AS avg_rental_rate,
	count(title) AS "num_of_films",
	ROUND(AVG(film.length) / AVG(film.rental_rate),2) AS avg_length
		FROM film
GROUP BY rating
ORDER BY case 
	when rating = 'G' then 1
	when rating = 'PG' then 2
	when rating = 'PG-13' then 3
	when rating = 'R' then 4
	when rating = 'NC-17' then 5
		end asc;