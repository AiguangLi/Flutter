import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';

class AnimationOpacityDemo extends StatefulWidget {
  AnimationOpacityDemo({Key key}) : super(key: key);

  @override
  _AnimationOpacityDemoState createState() => _AnimationOpacityDemoState();
}

class _AnimationOpacityDemoState extends State<AnimationOpacityDemo> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Animation Opacity'),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('images/building.jpg'), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: Icon(Icons.opacity),
      ),
    );
  }
}
