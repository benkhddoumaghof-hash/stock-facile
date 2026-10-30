
import 'package:sqflite/sqflite.dart';

import '../models/produit.dart';
import 'database_helper.dart';

class ProduitDao {
  static const String table = 'produits';

  Future<int> insererProduit(Produit produit) async {
    // 1. Récupérer la connexion à la base de données.
    final Database db = await DatabaseHelper().database;

    // 2. Insérer le produit dans la table et récupérer son identifiant.
    final int id = await db.insert(table, produit.toMap());

    // 3. Retourner l'identifiant du produit inséré.
    return id;
  }
}
