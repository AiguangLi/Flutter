import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material风格组件',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      color: Colors.white,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: '首页'),
        '/user': (context) => UserPage(title: '个人中心'),
      },
    );
  }
}

