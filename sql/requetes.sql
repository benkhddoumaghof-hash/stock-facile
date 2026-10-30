-- Q1.5.1 : Afficher tous les produits
SELECT * FROM produits;
1	Huile d'olive 1 L	18.5	24	1	2026-10-01T09:00:00	1
2	Couscous moyen 1 kg	2.3	40	1	2026-10-01T09:05:00	1
3	Eau minérale 1,5 L	0.85	120	1	2026-10-02T10:00:00	2
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
5	Savon de Marseille	2.9	15	1	2026-10-03T11:00:00	3
6	Cahier 96 pages	1.6	60	1	2026-10-04T08:30:00	4


-- Q1.5.2 : Afficher les produits en rupture de stock
SELECT * FROM produits
WHERE quantite = 0;



4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2



-- Q1.5.3 : Trier les produits du plus cher au moins cher
SELECT * FROM produits
ORDER BY prix DESC;
1	Huile d'olive 1 L	18.5	24	1	2026-10-01T09:00:00	1
4	Jus d'orange 1 L	3.2	0	0	2026-10-02T10:10:00	2
5	Savon de Marseille	2.9	15	1	2026-10-03T11:00:00	3
2	Couscous moyen 1 kg	2.3	40	1	2026-10-01T09:05:00	1
6	Cahier 96 pages	1.6	60	1	2026-10-04T08:30:00	4
3	Eau minérale 1,5 L	0.85	120	1	2026-10-02T10:00:00	2



-- Q1.5.4 : Afficher le nom de chaque produit avec sa catégorie
SELECT produits.nom, categories.nom AS categorie
FROM produits
INNER JOIN categories
ON produits.categorie_id = categories.id;


Huile d'olive 1 L	Alimentation
Couscous moyen 1 kg	Alimentation
Eau minérale 1,5 L	Boissons
Jus d'orange 1 L	Boissons
Savon de Marseille	Hygiène
Cahier 96 pages	Papeterie


-- Q1.5.5 : Compter le nombre de produits par catégorie
SELECT categories.nom, COUNT(produits.id) AS nombre_produits
FROM categories
INNER JOIN produits
ON categories.id = produits.categorie_id
GROUP BY categories.id, categories.nom;
Alimentation	2
Boissons	2
Hygiène	1
Papeterie	1


-- Q1.5.6 : Calculer la valeur totale du stock
SELECT SUM(prix * quantite) AS valeur_totale_stock
FROM produits;
777.5

Q4.6 :

L'exécution s'est terminée sans erreur.
Résultat : Requête exécutée avec succès. Elle a pris 9 ms 
À la ligne 1 :
-- Q4.6 : Insertion du produit Stylo bleu
INSERT INTO produits (
    nom,
    prix,
    quantite,
    disponible,
    date_ajout,
    categorie_id
)
VALUES (
    'Stylo bleu',
    0.500,
    100,
    1,
    '2026-10-30',
    4
);