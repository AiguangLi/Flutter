import 'dart:io';
import 'package:sqflite/sqflite.dart';

/*
 * 数据库管理类
 * 管理数据库的的打开，关闭，创建，版本等
 */
class DatabaseManager {
  //当前数据库版本
  static const int _VERSION = 1;
  //数据库名称
  static const String _DB_NAME = 'app.db';
  //单例数据库实例
  static Database _database;

  static initDB() async {
    var databasePath = await getDatabasesPath();
    String dbName = _DB_NAME;
    String dbFilePath = databasePath + dbName;
    if (Platform.isIOS) {
      dbFilePath = databasePath + '/' + dbName;
    }

    _database = await openDatabase(dbFilePath, version: _VERSION, onCreate:(Database db, int version) {
      //此处可以创建业务无关数据表
    });
  }

/*
 * 判断数据表是否存在
 */
  static isTableExist(String tableName) async {
    await getDatabase();
    String sql = "SELECT * FROM sqlite_master WHERE type = 'table' AND name = '$tableName'";
    var res = await _database.rawQuery(sql);

    return res != null && res.length > 0;
  }

  static getDatabase() async{
    if (_database == null) {
      await initDB();
    }

    return _database;
  }

  static close() async{
    await _database?.close();
    _database = null;
  }
}