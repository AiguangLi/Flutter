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
      '1. Container': '/container',
      '2. Center': '/center',
      '3. Align': '/align',
      '4. Fitted Box': '/fitted-box',
      '5. Stack': '/stack',
      '6. Box': '/box',
      '7. Ratio': '/ratio',
      '8. ListView': '/list',
      '9. GridView': '/gridview',
      '10. Table': '/table',
      '11. Other': '/other',
      '22. Composite Example': '/container'
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
