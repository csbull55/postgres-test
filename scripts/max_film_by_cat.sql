SELECT
	f.name,
	f.rating,
	f.count
FROM films_by_rating_category AS f
WHERE f.count =
	(SELECT
		MAX(frc.count)
	 FROM films_by_rating_category AS frc
	 WHERE frc.name = f.name)
ORDER BY f.name ASC;