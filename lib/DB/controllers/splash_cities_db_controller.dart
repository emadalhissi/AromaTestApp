import 'package:aroma_test_app/DB/db_operations.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_city.dart';
import 'package:aroma_test_app/models/API%20Models/Splash/splash_country.dart';

import 'package:sqflite/sqflite.dart';

import '../db_provider.dart';

class SplashCitiesDbController implements DbOperations<SplashCity> {
  final Database _database = DBProvider().database;

  @override
  Future<int> create(SplashCity object) async {
    // INSERT INTO contact (name, phone) VALUES ('Name','1234');
    print('inside create CITIES');
    var queryResult = await _database
        .rawQuery('SELECT * FROM CITIES WHERE id="${object.id}"');
    print('inside --- create CITIES');
    if (queryResult.isEmpty) {
      return await _database.insert('CITIES', object.toMap());
    }
    print('inside create CITIES, before return');
    return 0;
    // return await _database.insert('STUDENTS', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    //DELETE FROM contacts;
    //DELETE FROM contacts WHERE id = 1;
    int numberOfDeletedRows = await _database.delete(
      'CITIES',
      where: 'dbId = ?',
      whereArgs: [id],
    );
    return numberOfDeletedRows > 0;
  }

  @override
  Future<bool> clearDb() async {
    int numberOfDeletedRows = await _database.delete('CITIES');
    return numberOfDeletedRows > 0;
  }

  @override
  Future<List<SplashCity>> read() async {
    // SELECT * FROM contacts;
    print('check read CITIES');
    List<Map<String, dynamic>> rowsMap = await _database.query('CITIES');
    return rowsMap
        .map((Map<String, dynamic> rowMap) => SplashCity.fromMap(rowMap))
        .toList();
  }

  @override
  Future<SplashCity?> show(int id) async {
    // SELECT * FROM contacts WHERE id = ?;
    List<Map<String, dynamic>> rows =
        await _database.query('CITIES', where: 'id = ?', whereArgs: [id]);
    return rows.isNotEmpty ? SplashCity.fromMap(rows.first) : null;
  }

  @override
  Future<bool> update(SplashCity object) async {
    //UPDATE contacts SET name = 'NAME', phone = '1234';
    //UPDATE contacts SET name = 'NAME', phone = '1234' WHERE id = ?;
    int numberOfUpdatedRows = await _database.update(
      'CITIES',
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
