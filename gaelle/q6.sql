UPDATE commande
SET cache_prix_total = (SELECT SUM(prix_total) as prix_total_commande 
						FROM commande_ligne 	
    					WHERE commande_ligne.commande_id=commande.id);