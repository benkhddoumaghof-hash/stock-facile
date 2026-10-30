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
### Q2.1.Package	:Rôle
sqflite	:Permet à Flutter de communiquer avec une base de données SQLite.
path	:Permet de construire correctement les chemins des fichiers, notamment celui de la base de données.
sqflite_common_ffi:	Permet d'utiliser SQLite sur Windows et Linux grâce à FFI.
### Q2.3
1. Pourquoi int? id ?
- int signifie un nombre entier.
- ? signifie que la valeur peut être null.
- Quand on crée une nouvelle catégorie, elle n'a pas encore d'identifiant.
- SQLite lui attribuera automatiquement un ID lors de l'insertion.
2. Pourquoi if (id != null) 'id': id ?

Cela signifie : ajouter l'ID dans la Map uniquement s'il existe déjà. Sinon, SQLite génère lui-même l'identifiant grâce à AUTOINCREMENT.
### Q2.4:question de reflexion:
1. Pourquoi utiliser factory ?
Parce qu'il permet de créer un objet Produit à partir d'une Map récupérée depuis SQLite.

2. Pourquoi (map['prix'] as num).toDouble() ?
Parce que le prix peut être un entier (int) ou un décimal (double). toDouble() garantit qu'il sera converti en double.
Q3.2 — Questions de réflexion
(1) Que se passe-t-il si on écrit deux fois DatabaseHelper() ? Combien d'objets sont créés ?

Un seul objet est créé. Grâce au constructeur factory, les deux appels retournent la même instance de DatabaseHelper().

(2) Que fait l'opérateur ??= ?

Il affecte une valeur à une variable uniquement si elle est null. Sinon, il garde sa valeur actuelle.

(3) Pourquoi placer PRAGMA foreign_keys = ON dans onConfigure et non dans onCreate ?

Parce que onConfigure est exécuté à chaque ouverture de la base, alors que onCreate est exécuté uniquement lors de sa création. Ainsi, les clés étrangères sont activées à chaque ouverture.

(4) Combien de fois onCreate est-il appelé dans toute la vie de l'application ?

Une seule fois lors de la création initiale de la base de données. Il n'est pas rappelé lors des ouvertures suivantes, sauf si la base est supprimée et recréée.
### Q3.5 — Est-ce que onCreate s'affiche encore ?
Réponse à mettre dans reponses.md :

Non, le message onCreate ne s'affiche pas lors du deuxième lancement, car cette fonction s'exécute uniquement lors de la première création de la base de données. Lors des lancements suivants, la base existe déjà.

Si on supprime la base et qu'on la recrée, onCreate s'exécutera de nouveau.