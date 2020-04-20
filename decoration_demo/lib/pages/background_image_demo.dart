import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

enum DecorationMode {
  Image,
  Border,
  Shadow,
}

class BackgourndImageDemo extends StatefulWidget {
  BackgourndImageDemo({Key key}) : super(key: key);

  @override
  _BackgourndImageDemoState createState() => _BackgourndImageDemoState();
}

class _BackgourndImageDemoState extends State<BackgourndImageDemo> {
  DecorationMode decorationMode;

  @override
  void initState() {
    super.initState();
    decorationMode = DecorationMode.Image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFactory.buildCenterAppBar('Background Image Decoration'),
        body: Center(
          child: getDecorationWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              switch (decorationMode) {
                case DecorationMode.Image:
                  decorationMode = DecorationMode.Border;
                  break;
                case DecorationMode.Border:
                  decorationMode = DecorationMode.Shadow;
                  break;
                case DecorationMode.Shadow:
                  decorationMode = DecorationMode.Image;
                  break;
                default:
                  break;
              }
            });
          },
          child: Icon(Icons.repeat),
        ));
  }

  Widget getDecorationWidget() {
    switch (decorationMode) {
      case DecorationMode.Image:
        return getImageDecoration();
        break;
      case DecorationMode.Border:
        return getBorderDecoration();
        break;
      case DecorationMode.Shadow:
        return getShadowDecoration();
        break;
      default:
        return null;
        break;
    }
  }

  Widget getImageDecoration() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          image: DecorationImage(
              image: ExactAssetImage('images/bmw.png'), fit: BoxFit.cover)),
    );
  }

  Widget getBorderDecoration() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(color: Colors.lightGreen, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: ExactAssetImage('images/bmw.png'), fit: BoxFit.cover)),
    );
  }

  Widget getShadowDecoration() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(color: Colors.lightGreen, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.green,
                blurRadius: 6.0,
                spreadRadius: 6.0,
                offset: Offset(-1.0, 1.0)),
          ],
          image: DecorationImage(
              image: ExactAssetImage('images/bmw.png'), fit: BoxFit.cover)),
    );
  }
}
