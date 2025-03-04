import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../views/custom_widgets/custom_snackbar.dart';

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
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites (
            id TEXT PRIMARY KEY,
            title TEXT,
            authors TEXT,
            thumbnail TEXT
          )
        ''');
      },
    );
  }

  Future<void> addToFavorites(Map<String, dynamic> book) async {
    final db = await database;
    await db.insert('favorites', book, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return await db.query('favorites');
  }

  Future<void> removeFromFavorites(String id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final db = await database;
    final result = await db.query('favorites', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }
}
