1)  SELECT * FROM client WHERE prenom = 'Muriel' AND password = SHA1('test11');
2)  SELECT nom FROM commande_ligne group by nom having count(*) > 1;
3)  SELECT id, nom FROM commande_ligne group by nom having count(*) > 1;
4)  UPDATE commande_ligne SET prix_total = prix_unitaire * quantite;

5)  SELECT commande_ligne.prix_total, commande.date_achat, client.nom, client.prenom
    FROM commande_ligne 
    INNER JOIN commande
    ON commande_ligne.id = commande.id 
    INNER JOIN client
    ON commande.id = client.id;

6)  UPDATE commande SET cache_prix_total = (SELECT SUM(prix_total) FROM commande_ligne WHERE commande.id = commande_id);
7)  SELECT SUM(cache_prix_total) FROM commande group by MONTH(date_achat);


8)  SELECT cache_prix_total, client.nom, client.prenom FROM commande
    INNER JOIN client
    ON client.id = commande.client_id
    ORDER BY cache_prix_total DESC LIMIT 10;
    
9)  SELECT SUM(cache_prix_total), date_achat FROM commande GROUP BY date_achat;

10) ALTER TABLE commande
    ADD category int;

11) UPDATE commande 
     SET category = (CASE 
                        WHEN cache_prix_total < 200 THEN "1"
                        WHEN cache_prix_total >= 200 AND cache_prix_total <= 500 THEN "2"
                        WHEN cache_prix_total >= 500 AND cache_prix_total <= 1000 THEN "3"
                        WHEN cache_prix_total >= 1000 THEN "4"
                        END);

12) CREATE TABLE commande_category (
    id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(200) NOT NULL,
    PRIMARY KEY(id));
    
13) INSERT INTO commande_category (category) VALUES
        ('“1” pour les commandes de moins de 200€'),
        ('“2” pour les commandes entre 200€ et 500€'),
        ('“3” pour les commandes entre 500€ et 1.000€'),
        ('“4” pour les commandes supérieures à 1.000€');

14) DELETE FROM commande WHERE DATE(date_achat) < DATE("2019-02-01");