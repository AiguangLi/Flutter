import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:storage_demo/database/database_manager.dart';

abstract class DatabaseProvider {
  bool isTableExist = false;

  createTableSql();
  tableName();

  Future<Database> getDatabase() async {
    return await open();
  }

/*
 * 传入表名和创建表sql
 * 如果表不存在，则执行sql创建表
 */
  @mustCallSuper
  prepare(tableName, createTableSql) async {
    isTableExist = await DatabaseManager.isTableExist(tableName);
    if (! isTableExist) {
      Database database = await DatabaseManager.getDatabase();

      return await database.execute(createTableSql);
    }
  }

  @mustCallSuper
  open() async {
    if (! isTableExist) {
      await prepare(tableName(), createTableSql());
    }

    return await DatabaseManager.getDatabase();
  }
}
