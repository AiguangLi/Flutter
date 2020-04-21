import 'package:decoration_demo/components/app_bar_factory.dart';
import 'package:flutter/material.dart';

class ClipDemo extends StatefulWidget {
  ClipDemo({Key key}) : super(key: key);

  @override
  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Clip Demo'),
      body: Center(
        child: ClipOval(
          child: SizedBox(
              child: Image.asset('images/villa.jpg', fit: BoxFit.fitHeight,), width: 300, height: 300),
        ),
      ),
    );
  }
}
