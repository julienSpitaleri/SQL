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