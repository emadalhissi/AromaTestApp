import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  late Database _database;

  static final DBProvider _instance = DBProvider._internal();

  factory DBProvider() {
    return _instance;
  }

  DBProvider._internal();

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db_sql1.sql');

    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE COUNTRIES ("
            "dbId INTEGER PRIMARY KEY AUTOINCREMENT,"
            "id INTEGER NOT NULL,"
            "title TEXT NOT NULL,"
            "prefix TEXT NOT NULL,"
            "code Integer NOT NULL,"
            "flag TEXT NOT NULL,"
            "cities TEXT"
            ")");
        await db.execute("CREATE TABLE CITIES ("
            "dbId INTEGER PRIMARY KEY AUTOINCREMENT,"
            "id INTEGER NOT NULL,"
            "title TEXT NOT NULL,"
            "countryId TEXT"
            ")");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
