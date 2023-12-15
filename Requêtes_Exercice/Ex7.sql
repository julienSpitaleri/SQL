SELECT MONTH(date_achat) AS month, SUM(cache_prix_total) AS montant_global FROM `commande` GROUP BY month
