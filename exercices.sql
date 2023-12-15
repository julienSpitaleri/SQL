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

6) 