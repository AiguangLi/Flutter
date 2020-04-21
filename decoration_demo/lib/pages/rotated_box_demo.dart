import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

class RotatedBoxDemo extends StatefulWidget {
  const RotatedBoxDemo({Key key}) : super(key: key);

  _RatatedBoxDemoState createState() => _RatatedBoxDemoState();
}

class _RatatedBoxDemoState extends State<RotatedBoxDemo> {
  int rotatedTurns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFactory.buildCenterAppBar('Rotated Box Demo'),
        body: Center(
          child: RotatedBox(
            quarterTurns: rotatedTurns,
            child: Container(
              child: Image.asset(
                'images/bmw.png',
                fit: BoxFit.contain,
              ),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            rotatedTurns++;
          });
        },
        child: Icon(Icons.refresh),
      )
    );
  }
}
