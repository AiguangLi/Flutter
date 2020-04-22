import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

enum PainterType {
  line,
  oval,
  circle,
  roundRect,
  doubleRRect,
}

class PainterDemo extends StatefulWidget {
  PainterDemo({Key key}) : super(key: key);

  @override
  _PainterDemoState createState() => _PainterDemoState();
}

PainterType type = PainterType.line;
int typeIndex = 0;

class _PainterDemoState extends State<PainterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Painter Demo'),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: getPaint(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            type =
                PainterType.values[(typeIndex++) % PainterType.values.length];
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget getPaint() {
    return CustomPaint(
      painter: getPainter(),
      child: Center(
        child: Text(
          '绘制${type.toString()}',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }

  CustomPainter getPainter() {
    switch (type) {
      case PainterType.line:
        return LinePainter();
        break;
      case PainterType.circle:
        return CirclePainter();
        break;
      case PainterType.oval:
        return OvalPainter();
        break;
      case PainterType.roundRect:
        return RoundRectPainter();
        break;
      case PainterType.doubleRRect:
        return DoubleRoundRectPainter();
        break;
      default:
        return LinePainter();
        break;
    }
  }
}

class LinePainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(20, 20), Offset(20, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(200, 200), 100, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class OvalPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTWH(50, 50, 300, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RoundRectPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(50, 50, 300, 100), Radius.circular(20.0)),
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DoubleRoundRectPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.lightGreen
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect1 = Rect.fromLTWH(150, 150, 100, 100);
    Rect rect2 = Rect.fromLTWH(100, 100, 200, 200);
    RRect outer = RRect.fromRectAndRadius(rect2, Radius.circular(10.0));
    RRect inner = RRect.fromRectAndRadius(rect1, Radius.circular(10.0));
    canvas.drawDRRect(outer, inner, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
