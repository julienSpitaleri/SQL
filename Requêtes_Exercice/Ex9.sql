SELECT date_achat, SUM(cache_prix_total) AS total FROM commande GROUP BY date_achat
