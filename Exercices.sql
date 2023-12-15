SELECT * FROM `client` WHERE prenom = 'Muriel' AND password = SHA1('test11');

select nom from commande_ligne group by nom having count(nom) > 1;