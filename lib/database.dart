import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "users.db";
  static final _databaseVersion = 1;

  static final table = 'mk';

  static final columnId = 'userID';
  static final columnUsername = 'userUSERNAME';
  static final columnPassword = 'userPASSWORD';

  // Create a single instance of the database
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnUsername TEXT NULL,
            $columnPassword TEXT NULL,
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(row) async {
    Database db = await instance.database;
    return await db.query(table);
  }


  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteall() async {
    Database db = await instance.database;
    return await db.delete(table);
  }

  Future<int> signup(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  /*Future<List<Map<String, dynamic>>> login(Map<String, dynamic> row) async {
    Database db = await instance.database;
    var list = row.values.toList();
    print(list[1]);
    var username = list[0];
    var password = list[1];
    /*try {*/
    /*var userid = await db.rawQuery('SELECT COUNT(id) FROM $table WHERE username=$username');
        try {
          return await db.rawQuery('SELECT(*) FROM $table WHERE username=$userid AND password=$password');
         } catch (error) {
            print("wrong password: $error");
         }
    } catch (error) {
      print("Username not Found: $error");
    }*/
    return await db.rawQuery("SELECT(*) FROM $table WHERE username=$username AND password=$password");
    
  }
  */

}
