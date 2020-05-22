import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'route_handler.dart';
import 'package:plugins/common/not_found.dart';
import 'package:plugins/routers/abstact_routers.dart';

class Routes implements IRouter {
  static String root = '/';
  static String homePage = '/home';

  Map<String, Handler> _routeMap = {
    '/': loadingHandler,
    '/home': appHomeHandler,
    '/search': searchHandler,
    '/messageDetail': messageDetailHandler,
  };

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
    });

    _routeMap.forEach((routePath, handler) {
      router.define(routePath, handler: handler);
    });
  }
}
