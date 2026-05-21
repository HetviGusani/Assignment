import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDB {
  static late final _databasename = "task.db";
  static final _databaseVersion = 1;
  static final table = 'task';
  static final columnId = '_id';
  static final columnTask = 'name';
  static Database? _database;

  MyDB._privateConstructor();

  static final MyDB instance = MyDB._privateConstructor();

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE $table($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnTask TEXT NOT NULL) ''',
    );
  }

  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databasename);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<int> insertTask(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, Object?>>> fetchData() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> editTask(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(
      table,
      {columnTask: row[columnTask]},
      where: '$columnId = ?',
      whereArgs: [row[columnId]],
    );
  }

  Future<int> deleteTask(Map<String, dynamic> value) async {
    Database db = await instance.database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [value[columnId]],
    );
  }
}
