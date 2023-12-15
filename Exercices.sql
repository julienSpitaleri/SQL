SELECT * FROM `client` WHERE prenom = 'Muriel' AND password = SHA1('test11');

select nom from commande_ligne group by nom having count(nom) > 1;


select nom , commande_id from commande_ligne group by nom having count(nom) > 1;

UPDATE commande_ligne 
SET prix_total = (prix_unitaire) * quantite;

SELECT prix_total from commande_ligne 
JOIN (SELECT prenom , nom from client) AS clients;

SELECT prix_total,date_achat,client.prenom, client.nom from commande_ligne
INNER JOIN client ON client.id = commande_ligne.id 
INNER JOIN commande ON commande.id = commande_ligne.id;