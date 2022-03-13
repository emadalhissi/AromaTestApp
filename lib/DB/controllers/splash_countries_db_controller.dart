import 'package:aroma_test_app/DB/db_operations.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_country.dart';

import 'package:sqflite/sqflite.dart';

import '../db_provider.dart';

class SplashCountriesDbController implements DbOperations<SplashCountry> {
  final Database _database = DBProvider().database;

  @override
  Future<int> create(SplashCountry object) async {
    // INSERT INTO contact (name, phone) VALUES ('Name','1234');
    print('inside create');
    var queryResult = await _database
        .rawQuery('SELECT * FROM COUNTRIES WHERE id="${object.id}"');
    print('inside --- create');
    if (queryResult.isEmpty) {
      return await _database.insert('COUNTRIES', object.toMap());
    }
    print('inside create, before return');
    return 0;
    // return await _database.insert('STUDENTS', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    //DELETE FROM contacts;
    //DELETE FROM contacts WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'COUNTRIES',
      where: 'dbId = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<bool> clearDb() async {
    int numberOfDeletedRows = await _database.delete('COUNTRIES');
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<SplashCountry>> read() async {
    // SELECT * FROM contacts;
    print('check read');
    List<Map<String, dynamic>> rowsMap = await _database.query('COUNTRIES');
    return rowsMap
        .map((Map<String, dynamic> rowMap) => SplashCountry.fromMap(rowMap))
        .toList();
  }

  @override
  Future<SplashCountry?> show(int id) async {
    // SELECT * FROM contacts WHERE id = ?;
    List<Map<String, dynamic>> rows =
        await _database.query('COUNTRIES', where: 'id = ?', whereArgs: [id]);
    return rows.isNotEmpty ? SplashCountry.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(SplashCountry object) async {
    //UPDATE contacts SET name = 'NAME', phone = '1234';
    //UPDATE contacts SET name = 'NAME', phone = '1234' WHERE id = ?;
    int numberOfUpdatedRows = await _database.update(
      'COUNTRIES',
      object.toMap(),
      where: 'id = ?',
      whereArgs: [object.id],
    );
    return numberOfUpdatedRows > 0;
  }

  @override
  Future<bool> deleteDateToUser(int id) {
    // TODO: implement deleteDateToUser
    throw UnimplementedError();
  }
}
