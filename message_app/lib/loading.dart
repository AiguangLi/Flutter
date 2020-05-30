import 'package:flutter/material.dart';
import 'package:plugins/plugins.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //延迟2秒进入主页（用于引导）
    Future.delayed(Duration(seconds: 2), () {
      //设置replace为true隐藏返回按钮
      RouteManager.router.navigateTo(context, '/login', replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    //ToDo加载一个动画
    return Center(
       child: Stack(
         children: <Widget>[
           Image.asset('images/loading.jpg', fit: BoxFit.cover,),
         ],
       ),
    );
  }
}
