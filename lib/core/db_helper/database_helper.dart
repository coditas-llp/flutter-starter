import 'package:flutter/foundation.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';

import '../utility/utils.dart';
import 'table_structures.dart';

/// Use
/// Database db = await DatabaseHelper().db;
/// await db.rawQuery(query)
class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  ///OR
  factory DatabaseHelper() => instance;

  static Database? _database;

  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  ///database name
  final dbName = "my_database1";

  _initDatabase() async {
    String path = join(await getDatabasesPath(), '$dbName.db');
    return await openDatabase(path, version: 16, onCreate: (db, version) async {
      /// add queries on database created
      await master(db);
      await transaction(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      /// add code on database update
    });
  }

  clearDatabase() async {
    var tables = [master1Structure, transaction1Structure];
    Database dbb = await db;
    for (String tableName in tables) {
      await dbb.delete(tableName);
    }
  }

  master(Database db) async {
    db.execute(master1Structure);
  }

  transaction(Database db) async {
    db.execute(transaction1Structure);
    db.execute("insert into '$transaction1' "
        '''
    ('userName', 'userAge', 'desc') VALUES
  ('One One', '11', 'Age is 11'),
  ('One Two', '12', 'Age is 12'),
  ('One Three', '13', 'Age is 13'),
  ('One Four', '14', 'Age is 14');
    ''');
  }

  static saveInDB(String tableName, List<dynamic> maps) async {
    try {
      Database db = await DatabaseHelper().db;
      Batch batch = db.batch();
      for (var element in maps) {
        batch.insert(tableName, element,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit(noResult: true, continueOnError: true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<Map<String, dynamic>>?> getData(String tableName,
      {String whClause = ""}) async {
    try {
      Database db = await DatabaseHelper().db;
      String query = " SELECT * FROM $tableName $whClause ";
      List<Map<String, dynamic>> maps = await db.rawQuery(query);
      return maps.isNotEmpty ? maps : [];
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future deleteData(String tableName, {String whereClause = ""}) async {
    Database db = await DatabaseHelper().db;
    String query = " DELETE FROM $tableName $whereClause";
    await db.rawQuery(query);
  }

  static Future modifyData(String tableName,
      {required Map<String, dynamic> data}) async {
    try {
      Database db = await DatabaseHelper().db;
      await db.insert(
        tableName,
        {"modifiedDate": DateTime.now().toUTCIso8601String, ...data},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
