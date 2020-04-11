import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/page_list.dart';
import 'pages/indicator_page.dart';
import 'pages/alert_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PageList(title: '首页'),
        '/indicator': (context) => IndicatorPage(title: 'Indicator指示器'),
        '/alert_dialog': (context) => AlertDialogPage(title: 'AlertDialog指示器'),
      },
    );
  }
}