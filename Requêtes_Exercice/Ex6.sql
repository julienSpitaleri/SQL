UPDATE commande SET cache_prix_total = (SELECT SUM(prix_total) FROM commande_ligne WHERE commande_id = commande.id)
