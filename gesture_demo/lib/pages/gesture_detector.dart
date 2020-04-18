import 'package:flutter/material.dart';
import 'package:gesture_demo/components/app_bar_factory.dart';

class GestureDetectorDemo extends StatefulWidget {
  GestureDetectorDemo({Key key}) : super(key: key);
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  String tapName;

  ///使用GlobalKey存储ScaffoldState，以便在BuildContext外使用Scaffold
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    tapName = 'No Gesture Detected!';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarFactory.buildCenterAppBar('Gesture Detector'),
        body: Center(
          child: GestureDetector(
            onTap: () {
              handleGesture('Tapped!');
            },
            onDoubleTap: () {
              handleGesture('Double Tapped');
            },
            onLongPress: () {
              handleGesture('Long Pressed!');
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 40.0,
                  child: Text('测试按钮'),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Expanded(child: Text(tapName)),
              ],
            ),
          ),
        ),
      );
  }

  void handleGesture(String gestureType) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(gestureType)));
    setState(() {
      tapName = gestureType;
    });
  }
}
