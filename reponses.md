## Partie 01 — Création de la base de données

### Q1.3 — Vérification de la structure

**1. Comment SQLite stocke-t-il `disponible` et `date_ajout` ?**

- `disponible` : stocké sous forme d'un entier (`INTEGER`), avec `1` pour vrai et `0` pour faux.
- `date_ajout` : stocké sous forme de texte (`TEXT`), au format ISO 8601.

**2. Quel est le rôle de `AUTOINCREMENT`, `UNIQUE` et `CHECK (prix >= 0)` ?**

- `AUTOINCREMENT` : permet de générer automatiquement un identifiant qui augmente à chaque nouvel enregistrement.
- `UNIQUE` : empêche d'avoir deux catégories avec le même nom.
- `CHECK (prix >= 0)` : garantit que le prix ne peut pas être négatif.

**3. Que signifie `ON DELETE RESTRICT` ?**

Cela empêche de supprimer une catégorie si des produits sont encore associés à cette catégorie.
**4.Pourquoi écrit-on 'Huile d''olive' avec deux apostrophes ?**

On utilise deux apostrophes pour représenter une seule apostrophe dans une chaîne de caractères SQL. Le résultat enregistré est Huile d'olive.
## Q1.6 — Test des contraintes

**a) Prix négatif**

L'exécution s'est terminée avec des erreurs.
Résultat : CHECK constraint failed: prix >= 0
À la ligne 1 :
INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test prix', -5, 1, '2026-10-05T08:00:00', 1);

**b) Catégorie inexistante**

L'exécution s'est terminée avec des erreurs.
Résultat : FOREIGN KEY constraint failed
À la ligne 1 :
INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test catégorie', 1, 1, '2026-10-05T08:00:00', 99);

**c) Suppression d'une catégorie contenant des produits**

L'exécution s'est terminée avec des erreurs.
Résultat : FOREIGN KEY constraint failed
À la ligne 1 :
DELETE FROM categories WHERE id = 1;
### Q1.8 — Fermeture de la base de données

Il est important de fermer DB Browser ou la base de données avant qu'un autre programme, comme notre application Flutter, écrive dans le même fichier.

Cela permet d'éviter les conflits d'accès et les problèmes de verrouillage du fichier SQLite. Cela garantit également que les modifications sont bien enregistrées et évite les risques de corruption des données.