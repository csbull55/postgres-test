SELECT 
	p.amount,
	COUNT(p.payment_id) AS count
FROM payment AS p
GROUP BY p.amount
HAVING COUNT(p.payment_id) > 20
ORDER BY p.amount;