import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handler.dart';
import 'package:plugins/common/not_found.dart';
import 'package:plugins/routers/abstact_routers.dart';

class Routes implements IRouter{
  static String root = '/';
  static String homePage = '/home';


  Routes._();

  static Routes _instance;

  static Routes getSharedInstance() {
    if (_instance == null) {
      _instance = Routes._();
    }

    return _instance;
  }
  //配置路由对象
  @override
  void configureRoutes(Router router) {

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return NotFoundPage();
      }
    );

    router.define(root, handler: loadingHandler);
    router.define(homePage, handler: appHomeHandler);

  }
}
