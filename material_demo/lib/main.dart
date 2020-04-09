import 'package:flutter/material.dart';
import 'package:material_demo/pages/page_list.dart';
import 'pages/home.dart';
//import 'pages/user.dart';
import 'pages/default_tabbar.dart';
import 'pages/tabbar_items.dart';
import 'pages/page_list.dart';
import 'pages/drawer_demo.dart';

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
        '/': (context) => PageList(title: '首页'),
        '/home': (context) => HomePage(title: '首页'),
        '/tabbar': (context) => DefaultTabBarDemo(title: 'Tabbar示例'),
        '/tabbar_items': (context) => TabBarItemsDemo(title: 'TabbarItems示例'),
        '/drawer': (context) => DrawerDemo(title: 'Drawer示例'),
      },
    );
  }
}
