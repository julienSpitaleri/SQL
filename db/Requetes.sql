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

