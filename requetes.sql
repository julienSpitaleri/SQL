

SELECT * 
FROM `client` 
WHERE `prenom` = 'Muriel'
AND `password` = SHA1("test11")


SELECT nom, COUNT(*) AS nbr_items 
FROM `commande_ligne` 
GROUP BY nom 
HAVING nbr_items > 1
ORDER BY nbr_items DESC


SELECT nom, COUNT(*) AS nbr_items , GROUP_CONCAT(`commande_id`) AS liste_commandes
FROM `commande_ligne` 
GROUP BY nom 
HAVING nbr_items > 1
ORDER BY nbr_items DESC


UPDATE `commande_ligne` 
SET  `prix_total` = (`quantite` * `prix_unitaire`)


SELECT client.prenom, client.nom, commande.date_achat, commande_id, SUM(prix_total) AS prix_commande 
FROM `commande_ligne` 
LEFT JOIN commande ON commande.id = commande_ligne.commande_id
LEFT JOIN client ON client.id = commande.client_id
GROUP BY `commande_id`


UPDATE commande AS t1 
INNER JOIN 
    ( SELECT commande_id, SUM(commande_ligne.prix_total) AS p_total 
      FROM commande_ligne 
      GROUP BY commande_id ) t2 
          ON  t1.id = t2.commande_id 
SET t1.cache_prix_total = t2.p_total


SELECT YEAR(`date_achat`), MONTH(`date_achat`), SUM(`cache_prix_total`) 
FROM `commande` 
GROUP BY YEAR(`date_achat`), MONTH(`date_achat`)
ORDER BY YEAR(`date_achat`), MONTH(`date_achat`)


SELECT client.nom, client.prenom, SUM(commande.cache_prix_total) AS client_montant
FROM `commande` 
LEFT JOIN client ON client.id = commande.client_id
GROUP BY commande.client_id
ORDER BY client_montant DESC
LIMIT 10


SELECT `date_achat`, SUM(`cache_prix_total`) 
FROM `commande` 
GROUP BY `date_achat`


ALTER TABLE `commande` ADD `category` TINYINT UNSIGNED NOT NULL AFTER `cache_prix_total`;


UPDATE `commande` 
SET `category` = (
  CASE 
     WHEN cache_prix_total<200 THEN 1
     WHEN cache_prix_total<500 THEN 2
     WHEN cache_prix_total<1000 THEN 3
     ELSE 4
  END )


CREATE TABLE `commande_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `commande_category` (`id`, `nom`) VALUES (1, 'commandes de moins de 200€');
INSERT INTO `commande_category` (`id`, `nom`) VALUES (2, 'commandes entre 200€ et 500€');
INSERT INTO `commande_category` (`id`, `nom`) VALUES (3, 'commandes entre 500€ et 1.000€');
INSERT INTO `commande_category` (`id`, `nom`) VALUES (4, 'commandes supérieures à 1.000€');


DELETE FROM `commande_ligne` 
WHERE `commande_id` IN ( SELECT id FROM commande WHERE date_achat < '2019-02-01' );
DELETE FROM `commande` WHERE date_achat < '2019-02-01';


