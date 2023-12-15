SELECT * FROM `client` WHERE prenom ='muriel' AND password =SHA1('test11');
SELECT nom from commande_ligne GROUP BY nom HAVING COUNT(nom) > 1
SELECT nom, commande_id from commande_ligne GROUP BY nom HAVING COUNT(nom) > 1
UPDATE commande_ligne SET prix_total = (prix_unitaire*quantite)