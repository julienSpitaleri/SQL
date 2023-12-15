SELECT commande_id, nom, COUNT(nom) AS somme FROM commande_ligne GROUP BY nom HAVING somme > 1
