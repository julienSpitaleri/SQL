--Consigne 1
SELECT `prenom`, `password` FROM `client` WHERE `prenom`="Muriel" and `password`=SHA1('test11');

--Consigne 2
SELECT nom, COUNT(*) AS nbr_items FROM `commande_ligne` GROUP BY nom HAVING nbr_items > 1;

--Consigne 3
SELECT nom, COUNT(*) AS nbr_items , GROUP_CONCAT(`commande_id`) AS ligne_commande FROM `commande_ligne` GROUP BY nom HAVING nbr_items > 1;

--Consigne 4
UPDATE `commande_ligne` SET `prix_total` = `prix_unitaire` * `quantite`;

--Consigne 5
SELECT client.prenom, client.nom, commande_id, commande.date_achat, prix_total FROM `commande_ligne` LEFT JOIN commande ON commande.id = commande_ligne.commande_id LEFT JOIN client ON client.id = commande.client_id GROUP BY `commande_id`;

--Consigne 6
UPDATE `commande` INNER JOIN (SELECT commande_id, SUM(commande_ligne.prix_total) AS somme FROM commande_ligne GROUP BY commande_id) tmp_table ON commande.id = tmp_table.commande_id SET commande.cache_prix_total = tmp_table.somme;

UPDATE `commande` SET cache_prix_total = (SELECT SUM(prix_total) FROM commande_ligne WHERE commande.id = commande_id);

--Consigne 7
SELECT YEAR(date_achat), MONTH(date_achat), SUM(cache_prix_total) FROM `commande` GROUP BY YEAR(date_achat), MONTH(date_achat)

--Consigne 8
SELECT client.prenom, client.nom, SUM(cache_prix_total) AS prix_total FROM `commande` LEFT JOIN client ON client.id = client_id GROUP BY client_id ORDER BY prix_total DESC LIMIT 10;

--Consigne 9
SELECT YEAR(date_achat), MONTH(date_achat), DAY(date_achat), SUM(cache_prix_total) AS prix_total FROM `commande` GROUP BY DAY(date_achat) ORDER BY YEAR(date_achat) ASC, MONTH(date_achat) ASC, DAY(date_achat) ASC;

--Consigne 10
ALTER TABLE commande ADD category NUMERIC NOT NULL;

--Consigne 11
UPDATE commande SET category = (
    CASE
    	WHEN `cache_prix_total` < 200 THEN 1
    	WHEN `cache_prix_total` < 500 THEN 2
    	WHEN `cache_prix_total` < 1000 THEN 3
    	ELSE 4
    END)

--Consigne 12
CREATE TABLE commande_category (
    `id` int NOT NULL AUTO_INCREMENT,
    `descriptif` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--Consigne 13
INSERT INTO commande_category VALUES (1, "pour les commandes de moins de 200€");
INSERT INTO commande_category VALUES (2, "pour les commandes entre 200€ et 500€");
INSERT INTO commande_category VALUES (3, "pour les commandes entre 500€ et 1.000€");
INSERT INTO commande_category VALUES (4, "pour les commandes supérieures à 1.000€")

--Consigne 14
DELETE FROM `commande` WHERE commande.date_achat < '2019-02-01';
DELETE FROM `commande_ligne` WHERE commande_id IN (SELECT id FROM commande WHERE date_achat < '2019-02-01');