SELECT * FROM `client` WHERE prenom ='muriel' AND password =SHA1('test11');
SELECT nom from commande_ligne GROUP BY nom HAVING COUNT(nom) > 1