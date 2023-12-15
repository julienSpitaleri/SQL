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

UPDATE commande SET cache_prix_total = (SELECT SUM(prix_total) FROM commande_ligne WHERE commande.id = commande_id);

SELECT MONTH(date_achat) as 'Mois',SUM(cache_prix_total) as 'prix mensuel'
FROM commande
GROUP By Month(date_achat)
ORDER BY Month(date_achat)

SELECT nom,prenom, client.id, sum(commande.cache_prix_total) 
FROM client 
LEFT JOIN commande 
ON client.id = client_id 
group by client_id 
ORDER by sum(commande.cache_prix_total) DESC 
LIMIT 10