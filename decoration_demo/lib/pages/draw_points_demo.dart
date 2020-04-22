import 'dart:math';

import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class DrawPointsDemo extends StatefulWidget {
  DrawPointsDemo({Key key}) : super(key: key);

  @override
  _DrawPointsDemoState createState() => _DrawPointsDemoState();
}

class _DrawPointsDemoState extends State<DrawPointsDemo> {
  int modeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Draw Points Demo'),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: CustomPaint(painter: getPointsPainter()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              modeIndex++;
            });
          },
          child: Icon(Icons.refresh)),
    );
  }

  CustomPainter getPointsPainter() {
    PointMode mode = PointMode.values[modeIndex % PointMode.values.length];

    return PointsPainter(pointMode: mode);
  }
}

class PointsPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 4.0;

  final PointMode pointMode;
  PointsPainter({Key key, this.pointMode});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(
        pointMode ?? PointMode.points,
        [
          Offset(50, 50),
          Offset(50, 100),
          Offset(100, 100),
          Offset(200, 200),
          Offset(150, 50),
          Offset(300, 300),
        ],
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
