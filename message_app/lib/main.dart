import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugins/routers/route_manager.dart';
import 'routers/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //将style设置到app
    SystemChrome.setSystemUIOverlayStyle(_style);
    RouteManager.initRouters(Routes.getSharedInstance());
    return MaterialApp(
      title: 'Message App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xFF1296db),
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
        cardColor: Color(0xEE1296db),
      ),
      onGenerateRoute: RouteManager.router.generator,
    );
  }
}
