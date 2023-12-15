Q1
SELECT * FROM `client`
WHERE prenom = 'Muriel'
AND password = SHA1('test11');

Q2
SELECT nom, COUNT(*) AS nbr_items 
FROM `commande_ligne` 
GROUP BY nom 
HAVING nbr_items > 1
ORDER BY nbr_items DESC

Q3
UPDATE `commande_ligne` 
SET  `prix_total` = (`quantite` * `prix_unitaire`)

Q4
SELECT client.prenom, client.nom, commande.date_achat, commande_id, SUM(prix_total) AS prix_commande 
FROM `commande_ligne` 
LEFT JOIN commande ON commande.id = commande_ligne.commande_id
LEFT JOIN client ON client.id = commande.client_id
GROUP BY `commande_id`
