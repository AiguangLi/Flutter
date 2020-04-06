import 'package:flutter/material.dart';
import 'package:ui_element_demo/pages/image_demo.dart';
import 'pages/text_demo.dart';
import 'pages/icon_demo.dart';
import 'pages/container.dart';
import 'pages/button_demo.dart';
import 'pages/listview_listtile_demo.dart';
import 'pages/listview_horizontal_list_demo.dart';
import 'pages/listview_builder_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI组件示例',
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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'UI组件示例'),
    );
  }
}
/*
Container属于一个容器组件，包含一个子Widget
本身支持alignment，padding等属性，以便调整子组件的布局
 */
class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title});
  
  final List subPageName = ['1. Container示例', '2. Image示例', '3. Text示例', '4. Icon示例',
                            '5. Button示例', '6. ListTile示例', '7. 水平列表示例', '8. 使用Builder构建ListView'];
  
  List<Widget> getSubPageListItems(BuildContext context) {
      List<Widget> items = List<Widget>();
      for(String pageName in subPageName) {
          items.add(ListTile(
              title: Text(pageName),
              onTap: () {
                  //ToDo：使用路由完成页面跳转
                  switch (subPageName.indexOf(pageName)) {
                      case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ContainerPage(title: pageName);
                          }));
                          break;
                      case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ImageDemo(title: pageName);
                          }));
                          break;
                      case 2:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return TextDemo(title: pageName);
                          }));
                          break;
                      case 3:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return IconDemo(title: pageName);
                          }));
                          break;
                      case 4:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ButtonDemo(title: pageName);
                          }));
                          break;
                      case 5:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ListTileDemoPage(title: pageName);
                          }));
                          break;
                      case 6:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return HorizontalListDemoPage(title: pageName);
                          }));
                          break;
                      case 7:
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ListViewBuilderDemoPage(title: pageName);
                          }));
                          break;
                      default:
                          break;
                  }
              },
          ));
      }
    
      return items;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text( this.title)),
        body: ListView(
          children: getSubPageListItems(context),
        )
    );
  }
}

