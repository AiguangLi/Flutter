import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/page_list.dart';
import 'pages/container_demo.dart';
import 'pages/center_demo.dart';
import 'pages/align_demo.dart';
import 'pages/fitted_box_demo.dart';
import 'pages/stack_alignment_demo.dart';
import 'pages/box_demo.dart';
import 'pages/ratio_demo.dart';

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
        '/container': (context) => ContainerDemo(),
        '/center': (context) => CenterDemo(),
        '/align': (context) => AlignDemo(),
        '/fitted-box': (context) => FittedBoxDemo(),
        '/stack': (context) => StackAlignmentDemo(),
        '/box': (context) => BoxDemo(),
        '/ratio': (context) => RatioDemo(),
      },
    );
  }
}

