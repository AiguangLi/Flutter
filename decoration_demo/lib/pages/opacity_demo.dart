import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
class OpacityDemo extends StatefulWidget {
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  @override
  void initState() {
    super.initState();
    opacity = 1.0;
  }

  double opacity;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Opactiy Demo'),
      body: Center(
        child: Opacity(
          opacity: opacity,
          child: Container(
            child: Text(
              'Opacity=${opacity.toStringAsFixed(1)}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            width: 300,
            height: 200,
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateOpacity();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  void updateOpacity() {
    setState(() {
      if (opacity > 0.1) {
        opacity -= 0.1;
      } else {
        opacity = 1.0;
      }
    });
  }
  
}
