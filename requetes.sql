--Q1
SELECT * 
FROM client 
WHERE prenom = "Muriel" 
AND password = SHA1("test11");

--Q2
SELECT *, COUNT(*) as nb 
FROM commande_ligne 
GROUP BY nom HAVING nb > 1; 

--Q3
SELECT 
    nom, 
    COUNT(*) as nb_commandes, 
    GROUP_CONCAT(commande_id SEPARATOR ", ") as commandes_id 
FROM commande_ligne 
GROUP BY nom HAVING nb_commandes > 1; 

--Q4
UPDATE commande_ligne 
SET prix_total = prix_unitaire*quantite; 

--Q5
SELECT 
    commande_id, 
    SUM(prix_total) as prix_total_commande 
FROM commande_ligne 
GROUP BY commande_id; 

--Q6
UPDATE commande
SET cache_prix_total = (SELECT SUM(prix_total) as prix_total_commande 
						FROM commande_ligne 	
    					WHERE commande_ligne.commande_id=commande.id);

--Q7
SELECT  
    MONTH(date_achat) AS mois_achat, 
    SUM(cache_prix_total) as total_commande 
FROM commande 
GROUP BY mois_achat; 

--Q8
SELECT 
    nom, 
    prenom, 
    SUM(cache_prix_total) as total_commande 
FROM client 
LEFT JOIN commande 
ON client.id = commande.client_id 
GROUP BY client.id
ORDER BY total_commande DESC
LIMIT 10;

--Q9
SELECT  
	date_achat,
    SUM(cache_prix_total) as total_commande 
FROM commande 
GROUP BY date_achat;

--Q10
ALTER TABLE commande
ADD category int NOT NULL;

--Q11
UPDATE commande
SET category = 
CASE
    WHEN cache_prix_total<200 THEN 1
    WHEN cache_prix_total<500 THEN 2
    WHEN cache_prix_total<1000 THEN 3
    ELSE 4
END;

--Q12
CREATE TABLE commande_category
(
    id int PRIMARY KEY NOT NULL,
    description VARCHAR(100)
);

--Q13
INSERT INTO commande_category (id, description) 
VALUES 
    (1, "commandes de moins de 200€"), 
    (2, "commandes entre 200€ et 500€"), 
    (3, "commandes entre 500€ et 1000€"), 
    (4, "commandes de plus de 1000€"); 

--Q14
DELETE FROM commande
WHERE date_achat < '2019-02-01';

DELETE FROM commande_ligne 
WHERE commande_id 
NOT IN (SELECT commande.id FROM commande); 