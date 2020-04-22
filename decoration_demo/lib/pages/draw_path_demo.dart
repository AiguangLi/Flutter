import 'package:flutter/material.dart';
import 'package:decoration_demo/components/app_bar_factory.dart';
import 'dart:ui';

class DrawPathDemo extends StatefulWidget {
  DrawPathDemo({Key key}) : super(key: key);

  @override
  _DrawPathDemoState createState() => _DrawPathDemoState();
}

class _DrawPathDemoState extends State<DrawPathDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Draw Points Demo'),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: CustomPaint(painter: PathPainter()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: Icon(Icons.refresh)),
    );
  }
}

class PathPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
    ..moveTo(50, 50)
    ..lineTo(100, 100)
    ..arcTo(Rect.fromLTWH(100, 100, 300, 300), 0.2, 0.5, false)
    ..conicTo(300, 350, 400, 400, 1.2)
    ..close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}