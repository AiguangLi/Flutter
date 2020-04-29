import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/route_demo.dart';
import '../pages/shared_storage_demo.dart';
import '../pages/file_storage_demo.dart';
import '../pages/sqlite_demo.dart';
import '../pages/db_user_list.dart';

Handler sharedStorageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SharedStorageDemo();
});

Handler fileStorageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FileStorageDemo();
});

Handler sqliteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SqliteDemo();
});

Handler dbUserHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DBUserList();
});

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RouteDemo();
});
