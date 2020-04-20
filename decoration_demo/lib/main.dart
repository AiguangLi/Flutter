import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/page_list.dart';
import 'pages/opacity_demo.dart';
import 'pages/background_image_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ///设置沉浸式状态栏（将半透明的状态栏改为透明颜色）
  final SystemUiOverlayStyle _style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    //将style设置到app
    SystemChrome.setSystemUIOverlayStyle(_style);
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PageList(),
        '/opacity': (context) => OpacityDemo(),
        '/bg_image': (context) => BackgourndImageDemo(),
      },
    );
  }
}

