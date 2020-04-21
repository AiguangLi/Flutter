import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

enum ClipType { Oval, RoundRect, Path, Rect }

class ClipDemo extends StatefulWidget {
  ClipDemo({Key key}) : super(key: key);

  @override
  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  ClipType type = ClipType.Oval;
  int typeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Clip Demo'),
      body: Center(
        child: getClippedWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            type = ClipType.values[(typeIndex++) % ClipType.values.length];
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget getClippedWidget() {
    switch (type) {
      case ClipType.Oval:
        return getOvalClip();
        break;
      case ClipType.RoundRect:
        return getRoundRectClip();
        break;
      case ClipType.Rect:
        return getRectClip();
        break;
      case ClipType.Path:
        return getPathClip();
        break;
      default:
        return null;
        break;
    }
  }

  Widget getOvalClip() {
    return ClipOval(
      child: SizedBox(
          child: Image.asset(
            'images/villa.jpg',
            fit: BoxFit.fitHeight,
          ),
          width: 300,
          height: 300),
    );
  }

  Widget getRoundRectClip() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
      child: SizedBox(
          child: Image.asset(
            'images/villa.jpg',
            fit: BoxFit.fitHeight,
          ),
          width: 300,
          height: 300),
    );
  }

  Widget getRectClip() {
    return ClipRect(
      clipper: RectClipper(),
      child: SizedBox(
          child: Image.asset(
            'images/villa.jpg',
            fit: BoxFit.fitHeight,
          ),
          width: 300,
          height: 300),
    );
  }

  Widget getPathClip() {
    return ClipPath(
      clipper: TriangleClipper(),
      child: SizedBox(
          child: Image.asset(
            'images/villa.jpg',
            fit: BoxFit.fitHeight,
          ),
          width: 300,
          height: 300),
    );
  }
}

class RectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(100, 100, 100, 100);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(100, 200);
    path.lineTo(200, 100);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
