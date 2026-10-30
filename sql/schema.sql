BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	INTEGER,
	"nom"	TEXT NOT NULL UNIQUE,
	"description"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "produits" (
	"id"	INTEGER,
	"nom"	TEXT NOT NULL,
	"prix"	REAL NOT NULL CHECK("prix" >= 0),
	"quantite"	INTEGER NOT NULL DEFAULT 0 CHECK("quantite" >= 0),
	"disponible"	INTEGER NOT NULL DEFAULT 1,
	"date_ajout"	TEXT NOT NULL,
	"categorie_id"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("categorie_id") REFERENCES "categories"("id") ON DELETE RESTRICT
);
INSERT INTO "categories" VALUES (1,'Alimentation','Produits secs et conserves');
INSERT INTO "categories" VALUES (2,'Boissons','Eaux, jus et sodas');
INSERT INTO "categories" VALUES (3,'Hygiène','Savons et produits d''entretien');
INSERT INTO "categories" VALUES (4,'Papeterie','Cahiers, stylos et fournitures');
INSERT INTO "produits" VALUES (1,'Huile d''olive 1 L',18.5,24,1,'2026-10-01T09:00:00',1);
INSERT INTO "produits" VALUES (2,'Couscous moyen 1 kg',2.3,40,1,'2026-10-01T09:05:00',1);
INSERT INTO "produits" VALUES (3,'Eau minérale 1,5 L',0.85,120,1,'2026-10-02T10:00:00',2);
INSERT INTO "produits" VALUES (4,'Jus d''orange 1 L',3.2,0,0,'2026-10-02T10:10:00',2);
INSERT INTO "produits" VALUES (5,'Savon de Marseille',2.9,15,1,'2026-10-03T11:00:00',3);
INSERT INTO "produits" VALUES (6,'Cahier 96 pages',1.6,60,1,'2026-10-04T08:30:00',4);
COMMIT;
