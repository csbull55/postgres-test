SELECT a.actor_id,
       a.first_name
       || ' '
       || a.last_name          AS NAME,
       Count(f.film_id)        AS num_of_films,
       Round(Avg(f.length), 2) AS avg_film_length
FROM   actor AS a
       INNER JOIN film_actor AS fa
               ON a.actor_id = fa.actor_id
       INNER JOIN film AS f
               ON fa.film_id = f.film_id
GROUP  BY a.actor_id
HAVING Count(f.film_id) > 35
--ORDER BY avg_film_length DESC
ORDER  BY num_of_films DESC;  