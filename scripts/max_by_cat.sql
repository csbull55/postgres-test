SELECT
	f.name,
	f.rating,
	f.count
FROM (SELECT c.name,
    f.rating,
    count(f.film_id) AS count
   FROM film f
     JOIN film_category fc ON f.film_id = fc.film_id
     JOIN category c ON fc.category_id = c.category_id
  GROUP BY c.name, f.rating) AS f
WHERE f.count =
	(SELECT
		MAX(frc.count)
	 FROM films_by_rating_category AS frc
	 WHERE frc.name = f.name)
ORDER BY f.name ASC;