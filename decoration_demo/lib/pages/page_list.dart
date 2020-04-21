import 'package:flutter/material.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
///
class PageList extends StatefulWidget {
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  @override
  void initState() {
    super.initState();

    pageNames = {
      '1. Opacity': '/opacity',
      '2. Decoration Demo': '/decoration',
      '3. Rotated Box': '/rotated',
      '4. Clip': '/clip',
    };
  }

  Map<String, String> pageNames;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('示例导航')),
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
