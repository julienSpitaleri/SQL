SELECT * FROM `client` WHERE prenom ='muriel' AND password =SHA1('test11');

SELECT nom from commande_ligne GROUP BY nom HAVING COUNT(nom) > 1

SELECT nom, commande_id from commande_ligne GROUP BY nom HAVING COUNT(nom) > 1

UPDATE commande_ligne SET prix_total = (prix_unitaire*quantite)

SELECT prix_total, date_achat, client.nom, client.prenom
FROM client
INNER JOIN commande
ON client.id = commande.id
INNER JOIN commande_ligne
ON client.id = commande_ligne.id

UPDATE commande SET cache_prix_total = (SELECT prix_total FROM commande_ligne WHERE id = commande.id)
