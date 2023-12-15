UPDATE commande
SET category = 
CASE
    WHEN cache_prix_total<200 THEN 1
    WHEN cache_prix_total<500 THEN 2
    WHEN cache_prix_total<1000 THEN 3
    ELSE 4
 END;