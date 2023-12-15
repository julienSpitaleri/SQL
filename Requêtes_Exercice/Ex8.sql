SELECT client_id, SUM(cache_prix_total) AS total FROM commande GROUP BY client_id ORDER BY total DESC LIMIT 10
