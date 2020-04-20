import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

enum DecorationMode {
  Image,
  Border,
  Shadow,
  LinearGradient,
  RaidalGradient,
}

class DecorationDemo extends StatefulWidget {
  DecorationDemo({Key key}) : super(key: key);

  @override
  _DecorationDemoState createState() => _DecorationDemoState();
}

class _DecorationDemoState extends State<DecorationDemo> {
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
                  decorationMode = DecorationMode.LinearGradient;
                  break;
                case DecorationMode.LinearGradient:
                  decorationMode = DecorationMode.RaidalGradient;
                  break;
                case DecorationMode.RaidalGradient:
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
      case DecorationMode.LinearGradient:
        return getGradientDecoration();
        break;
      case DecorationMode.RaidalGradient:
        return getRadialGradientDecoration();
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

  Widget getGradientDecoration() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(color: Colors.lightGreen, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: <Color>[
              Colors.lightGreen,
              Colors.green,
              Colors.lightGreen,
              Colors.blue,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0),
          )),
    );
  }

  Widget getRadialGradientDecoration() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(color: Colors.lightGreen, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
          gradient: RadialGradient(
            colors: <Color>[
              Colors.lightGreen,
              Colors.green,
              Colors.lightGreen,
              Colors.blue,
            ],
            center: const Alignment(0.0, 0.0),
            radius: 0.5,
          )),
    );
  }
}
