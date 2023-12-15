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

Q5 : Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes et y ajouter une colonne qui liste les identifiants des commandes associées.
SELECT client.prenom, client.nom, commande.date_achat, commande_id, SUM(prix_total) AS prix_commande 
FROM `commande_ligne` 
LEFT JOIN commande ON commande.id = commande_ligne.commande_id
LEFT JOIN client ON client.id = commande.client_id
GROUP BY `commande_id`

Q6 : Enregistrer le montant total de chaque commande dans le champ intitulé “cache_prix_total”
UPDATE commande AS t1 
INNER JOIN 
    ( SELECT commande_id, SUM(commande_ligne.prix_total) AS p_total 
      FROM commande_ligne 
      GROUP BY commande_id ) t2 
          ON  t1.id = t2.commande_id 
SET t1.cache_prix_total = t2.p_total

Q7 : Obtenir le montant global de toutes les commandes, pour chaque mois
SELECT YEAR(`date_achat`), MONTH(`date_achat`), SUM(`cache_prix_total`) 
FROM `commande` 
GROUP BY YEAR(`date_achat`), MONTH(`date_achat`)
ORDER BY YEAR(`date_achat`), MONTH(`date_achat`)

Q8 : Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, et obtenir ce montant total pour chaque client.
SELECT client.nom, client.prenom, SUM(commande.cache_prix_total) AS client_montant
FROM `commande` 
LEFT JOIN client ON client.id = commande.client_id
GROUP BY commande.client_id
ORDER BY client_montant DESC
LIMIT 10

Q9 : Obtenir le montant global de toutes les commandes, pour chaque mois
SELECT SUM(`cache_prix_total`) 
FROM `commande` 
GROUP BY `date_achat`

Q10 Ajouter une colonne intitulée “category” à la table contenant les commandes. 
Cette colonne contiendra une valeur numérique
Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
        “1” pour les commandes de moins de 200€
        “2” pour les commandes entre 200€ et 500€
        “3” pour les commandes entre 500€ et 1.000€
        “4” pour les commandes supérieures à 1.000€

Q11 Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
CREATE TABLE `commande_category` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL
);

Q12 Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée
INSERT INTO `commande_category` (`id`, `nom`, `description`) VALUES
(1, 'Commande de moins de 200€', 'Commande de moins de 200€'),
(2, 'Commande entre 200€ et 500€', 'Commande entre 200€ et 500€'),
(3, 'Commande entre 500€ et 1.000€', 'Commande entre 500€ et 1.000€'),
(4, 'Commande supérieure à 1.000€', 'Commande supérieure à 1.000€');