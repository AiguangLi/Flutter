import 'package:flutter/material.dart';
import 'package:gesture_demo/components/app_bar_factory.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/18
///
class PageList extends StatefulWidget {
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  @override
  void initState() {
    super.initState();

    pageNames = {
      '1. GestureDector': '/gesture_detector',
      '2. Dismissable': '/dismissable',
    };
  }

  Map<String, String> pageNames;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Gesture Demo'),
      body: ListView.builder(
          itemCount: pageNames.keys.length,
          controller: ScrollController(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(pageNames.keys.elementAt(index)),
              onTap: () {
                Navigator.pushNamed(
                    context, pageNames[pageNames.keys.elementAt(index)]);
              },
            );
          }),
    );
  }
}
