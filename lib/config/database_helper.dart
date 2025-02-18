import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dev_info_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE algorithms(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, answer TEXT, isRead INTEGER)');
        await db.execute(
            'CREATE TABLE careers(id INTEGER PRIMARY KEY, title TEXT, description TEXT, skills TEXT, salary TEXT, jobOutlook TEXT)');
        await db.execute(
            'CREATE TABLE programminglanguage ( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, icon TEXT, description TEXT, history TEXT, advantages TEXT, disadvantages TEXT, domains TEXT, frameworks TEXT, codeExample TEXT)');
        await db.execute(
            'CREATE TABLE project_ideas(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, imageUrl TEXT)');
        await db.execute(
            'CREATE TABLE quizzes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, language TEXT, difficulty TEXT, category TEXT, questions TEXT)');
        await db.execute(
            'CREATE TABLE tips(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)');
      },
      /* onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Ajoutez la colonne title si elle n'existe pas
          await db.execute('ALTER TABLE algorithms ADD COLUMN title TEXT');
        }
      }, */
    );
  }

  Future<void> supprimerBaseDeDonnees() async {
    String path = join(await getDatabasesPath(), 'dev_info_database.db');
    try {
      await deleteDatabase(path);
      print("Base de données supprimée avec succès.");
    } catch (e) {
      print("Erreur lors de la suppression de la base de données: $e");
    }
  }

  // Méthode générique pour insérer un enregistrement
  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Méthode générique pour récupérer tous les enregistrements
  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await database;
    return await db.query(table);
  }

  // Méthode générique pour mettre à jour un enregistrement
  Future<void> update(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  // Méthode générique pour supprimer un enregistrement
  Future<void> delete(String table, int id) async {
    final db = await database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertDefaultData() async {
    final db = await database;

    // Vérifiez si des données existent déjà
    List<Map<String, dynamic>> existingData = await db.query('algorithms');
    if (existingData.isEmpty) {
      // Charger les données par défaut à partir du fichier JSON
      String jsonString =
          await rootBundle.loadString('assets/default_data.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);

      // Insérer les données pour chaque table
      for (var algorithm in jsonData['algorithms']) {
        await db.insert('algorithms', algorithm);
      }
      for (var job in jsonData['jobs']) {
        await db.insert('jobs', job);
      }
      for (var language in jsonData['programming_languages']) {
        await db.insert('programming_languages', language);
      }
      for (var idea in jsonData['project_ideas']) {
        await db.insert('project_ideas', idea);
      }
      for (var quiz in jsonData['quizzes']) {
        await db.insert('quizzes', quiz);
      }
      for (var tip in jsonData['tips']) {
        await db.insert('tips', tip);
      }
      for (var resource in jsonData['resources']) {
        await db.insert('resources', resource);
      }
    }
  }
}
