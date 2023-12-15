SELECT nom, COUNT(*) as nb_commandes, GROUP_CONCAT(commande_id SEPARATOR ", ") as commandes_id 
FROM commande_ligne 
GROUP BY nom HAVING nb_commandes > 1; 