import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handler.dart';
import '../common/not_found.dart';

class Routes {
  static String root = '/';
  static String sharedStoragePage = '/sharedStorage';

  //配置路由对象
  static void configureRoutes(Router router) {

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NotFoundPage();
      }
    );

    router.define(sharedStoragePage, handler: sharedStorageHandler);
    router.define(root, handler: rootHandler);
  }
}
