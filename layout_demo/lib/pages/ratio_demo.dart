import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class RatioDemo extends StatefulWidget {
  RatioDemo({Key key}) : super(key: key);

  @override
  _RatioDemoState createState() => _RatioDemoState();
}

class _RatioDemoState extends State<RatioDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Ratio Demo'),
      body: Column(
        ///列对齐的方式（默认居中）
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200.0,
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                color: Colors.pinkAccent,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            height: 200,
            width: 200,
            child: FractionallySizedBox(
              alignment: Alignment.topLeft,
              widthFactor: 0.5,
              heightFactor: 1.5,
              child: Container(
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
