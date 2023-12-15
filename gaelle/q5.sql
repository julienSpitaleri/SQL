SELECT commande_id, SUM(prix_total) as prix_total_commande 
FROM commande_ligne 
GROUP BY commande_id; 