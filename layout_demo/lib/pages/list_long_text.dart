import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class ListViewLongTextDemo extends StatefulWidget {
  ListViewLongTextDemo({Key key}) : super(key: key);

  @override
  _ListViewLongTextDemoState createState() => _ListViewLongTextDemoState();
}

class _ListViewLongTextDemoState extends State<ListViewLongTextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('ListView with long text'),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text(
              '\nLiOS for Flutter Study',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Center(
            child: Text(
              'Flutter Demo',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Center(
            child: Text(
              '''Flutter是一个基于Dart语言的UI框架，其特点是一切组件都是Widget，并且采用了MVVMm模型。
              借助状态管理，模型驱动视图的方式对传统的MVC模式进行解耦。
              此外借助Dart的高级面向对象语言特性，实现了异步处理，动态特性。
              当前Flutter生态日益完善，在pub上可以找到很多开源的组件助力开发。
            ''',
              style: TextStyle(fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
