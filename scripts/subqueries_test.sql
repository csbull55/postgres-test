/*
this first query is using subqueries
checks if the length is above the average length for that rating
*/

SELECT 
	f.rating,
	COUNT(f.title) AS films_longer_than_avg
FROM film AS f
WHERE f.length >
	(SELECT 
		AVG(film_ratings.length)
	 FROM film AS film_ratings
	 WHERE film_ratings.rating = f.rating)
GROUP BY f.rating;

/*
this only checks if the length is above the average for all films, regardless of rating
*/

SELECT 
	f.rating,
	COUNT(f.title) AS films_longer_than_avg
FROM film AS f
WHERE f.length >
	(SELECT 
		AVG(f.length)
	 FROM film AS f)
GROUP BY f.rating;