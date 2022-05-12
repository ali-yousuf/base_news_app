import 'dart:async';

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

  FutureOr<void> _onCreate(Database db, int version) async{

  }
}
