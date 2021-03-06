import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handler.dart';
import '../common/not_found.dart';

class Routes {
  static String root = '/';
  static String sharedStoragePage = '/sharedStorage';
  static String fileStoragePage = '/fileStorage';
  static String sqlitePage = '/sqlite';
  static String usersPage = '/users';

  //配置路由对象
  static void configureRoutes(Router router) {

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NotFoundPage();
      }
    );

    router.define(sharedStoragePage, handler: sharedStorageHandler);
    router.define(fileStoragePage, handler: fileStorageHandler);
    router.define(sqlitePage, handler: sqliteHandler);
    router.define(usersPage, handler: dbUserHandler);
    router.define(root, handler: rootHandler);
  }
}
