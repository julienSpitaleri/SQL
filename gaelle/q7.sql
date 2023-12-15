SELECT  
    MONTH(date_achat) AS mois_achat, 
    SUM(cache_prix_total) as total_commande 
FROM commande 
GROUP BY mois_achat; 