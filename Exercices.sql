SELECT * FROM `client` WHERE prenom = 'Muriel' AND password = SHA1('test11');

select nom from commande_ligne group by nom having count(nom) > 1;


select nom , commande_id from commande_ligne group by nom having count(nom) > 1;

UPDATE commande_ligne 
SET prix_total = (prix_unitaire) * quantite;


SELECT prix_total,date_achat,client.prenom, client.nom from commande_ligne
INNER JOIN client ON client.id = commande_ligne.id 
INNER JOIN commande ON commande.id = commande_ligne.id;


UPDATE commande 
INNER JOIN(
SELECT commande_id, sum(prix_total) AS pt from commande_ligne
GROUP BY commande_id) AS calcul ON commande_id = commande.id
SET cache_prix_total = pt;


SELECT month(date_achat), sum(cache_prix_total)
FROM `commande` 
GROUP BY month(date_achat)
ORDER BY month(date_achat) ;


SELECT nom,prenom, client.id, sum(commande.cache_prix_total) 
FROM client 
LEFT JOIN commande 
ON client.id = client_id 
group by client_id 
ORDER by sum(commande.cache_prix_total) DESC 
LIMIT 10;



