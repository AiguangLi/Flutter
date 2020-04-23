import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handler.dart';
import '../pages/not_found.dart';

class Routes {
  static String root = '/';
  static String productDetailPage = '/productDetail';

  //配置路由对象
  static void configureRoutes(Router router) {

    ///应到跳到
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NotFoundPage();
      }
    );

    router.define(productDetailPage, handler: productDetailHandler);
    router.define(root, handler: rootHandler);
  }
}
