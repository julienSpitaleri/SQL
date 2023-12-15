SELECT *, COUNT(*) as nb 
FROM commande_ligne 
GROUP BY nom HAVING nb > 1; 