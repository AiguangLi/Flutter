import 'package:flutter/material.dart';
import 'package:plugins/routers/route_manager.dart';
import 'routers/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteManager.initRouters(Routes.getSharedInstance());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteManager.router.generator,
    );
  }
}