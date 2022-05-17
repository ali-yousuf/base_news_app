import 'dart:async';

import 'package:base_news_app/favourite/models/favourite.dart';
import 'package:base_news_app/home/models/news_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NewsDatabase {
  static final NewsDatabase instance = NewsDatabase._init();

  NewsDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('news.db');
    return _database!;
  }

  _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE favourite(id INTEGER PRIMARY KEY AUTOINCREMENT, author TEXT, title TEXT, description TEXT, url TEXT, urlToImage TEXT, publishedAt TEXT, content TEXT)');
  }

  Future<void> insertArticle(Favourite favourite) async {
    final db = await database;
    await db.insert(
      'favourite',
      favourite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Favourite>> getArticles() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('favourite');
    return List.generate(maps.length, (i) {
      return Favourite(
          id: maps[i]['id'],
          author: maps[i]['author'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          url: maps[i]['url'],
          urlToImage: maps[i]['urlToImage'],
          publishedAt: maps[i]['publishedAt'],
          content: maps[i]['content']);
    });
  }

  Future<void> deleteFavorite(String title) async {
    final db = await database;

    await db.delete(
      'favourite',
      where: 'title = ?',
      whereArgs: [title],
    );
  }
}
