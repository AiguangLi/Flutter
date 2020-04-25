import 'package:flutter/material.dart';
import 'package:storage_demo/components/app_bar_factory.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('404 Not Found'),
      body: Center(
        child: Text(
          'Sorry! The page is gone!',
          style: TextStyle(
              fontSize: 30.0, color: Colors.grey, fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
