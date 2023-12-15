SELECT  
	date_achat,
    SUM(cache_prix_total) as total_commande 
FROM commande 
GROUP BY date_achat;