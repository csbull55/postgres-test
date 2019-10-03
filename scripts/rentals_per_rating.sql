/*
This query uses a subquery to first count num of rentals by film
then averages those findings by rating
I'm not sure if this is the best way to do this
*/


SELECT a.rating,
       Round(Avg(a.num_of_rentals), 2) AS avg_rentals_per_film
FROM   (SELECT f.film_id,
               f.rating,
               Count(r.rental_id) AS num_of_rentals
        FROM   rental AS r
               JOIN inventory AS i
                 ON r.inventory_id = i.inventory_id
               JOIN film AS f
                 ON i.film_id = f.film_id
        GROUP  BY f.film_id) AS a
GROUP  BY a.rating
ORDER BY avg_rentals_per_film DESC;  