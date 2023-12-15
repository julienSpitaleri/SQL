DELETE FROM commande
WHERE date_achat < '2019-02-01';

DELETE FROM commande_ligne 
WHERE commande_id 
NOT IN (SELECT commande.id FROM commande); 