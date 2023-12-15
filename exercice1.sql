Q1 : Obtenir l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, 
sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
SELECT * FROM `client` WHERE prenom = 'Muriel';


SELECT * FROM `client`
WHERE prenom = 'Muriel'
AND password = SHA1('test11');


Q2 : Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.

SELECT nom, COUNT(*) AS nbr_items 
FROM `commande_ligne` 
GROUP BY nom 
HAVING nbr_items > 1
ORDER BY nbr_items DESC

Q3 : Obtenir la liste de tous les produits qui sont présent sur plusieurs 
commandes et y ajouter une colonne qui liste les identifiants des commandes associées.

SELECT nom, COUNT(*) AS nbr_items , GROUP_CONCAT(`commande_id`) AS liste_commandes
FROM `commande_ligne` 
GROUP BY nom 
HAVING nbr_items > 1
ORDER BY nbr_items DESC

Q4 : Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité
UPDATE `commande_ligne` 
SET  `prix_total` = (`quantite` * `prix_unitaire`)