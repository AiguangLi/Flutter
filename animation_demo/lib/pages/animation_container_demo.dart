import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';

class AnimationContainerDemo extends StatefulWidget {
  AnimationContainerDemo({Key key}) : super(key: key);

  @override
  _AnimationContainerDemoState createState() => _AnimationContainerDemoState();
}

class _AnimationContainerDemoState extends State<AnimationContainerDemo> {
  double _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Animation Container Demo'),
      body: Center(
          child: Container(
        height: 400,
        alignment: AlignmentDirectional.bottomStart,
        //InkWell是封装好各类手势检测，支持设置focus,hilight,hover等颜色的封装组件，但不适用与控件尺寸会改变的场合
        child: InkWell(
          onTap: () {
            setState(() {
              _height = 320;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getAnimatedContainer(40.0, _height - 40, Colors.blue),
              getAnimatedContainer(40.0, _height - 20, Colors.green),
              getAnimatedContainer(40.0, _height - 50, Colors.pink),
              getAnimatedContainer(40.0, _height - 30, Colors.orange),
            ],
          ),
        ),
      )),
    );
  }

  AnimatedContainer getAnimatedContainer(
      double width, double height, Color color,
      [int durationInSeconds = 1,
      EdgeInsets margin = const EdgeInsets.only(left: 10.0)]) {
    return AnimatedContainer(
        duration: Duration(seconds: durationInSeconds),
        width: width,
        height: height,
        color: color,
        margin: margin);
  }
}
