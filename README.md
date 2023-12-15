# SQL
Exercice SQL – Système de commandes

Les exercices SQL présent sur cette page se base sur un système informatique gérant des clients, et les commandes effectuées par ceux-ci. Le niveau de difficulté de ces exercices est “moyen”.
Prérequis

Veuillez télécharger les tables suivantes qui contiennent les informations principales de ce système d’information

    Table “Clients” 
    Table “Commandes” 
    Table “Lignes des commandes” 

Et les importer dans une nouvelle base de données que vous devez créer pour l'exercice.

Veuillez trouver les requêtes SQL permettant d’effectuer chacune des demandes suivantes :

    Obtenir l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
    Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.
    Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes et y ajouter une colonne qui liste les identifiants des commandes associées.
    Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité
    Obtenir le montant total pour chaque commande et y voir facilement la date associée à cette commande ainsi que le prénom et nom du client associé
    (difficulté très haute) Enregistrer le montant total de chaque commande dans le champ intitulé “cache_prix_total”
    Obtenir le montant global de toutes les commandes, pour chaque mois
    Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, et obtenir ce montant total pour chaque client.
    Obtenir le montant total des commandes pour chaque date
    Ajouter une colonne intitulée “category” à la table contenant les commandes. Cette colonne contiendra une valeur numérique
    Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
        “1” pour les commandes de moins de 200€
        “2” pour les commandes entre 200€ et 500€
        “3” pour les commandes entre 500€ et 1.000€
        “4” pour les commandes supérieures à 1.000€
    Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
    Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée
    Supprimer toutes les commandes (et les lignes des commandes) inférieur au 1er février 2019. Cela doit être effectué en 2 requêtes maximum
