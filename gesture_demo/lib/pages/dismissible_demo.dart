import 'package:flutter/material.dart';
import 'package:gesture_demo/components/app_bar_factory.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/18
///
class DismissibleDemo extends StatefulWidget {
  _DissmissiableDemoState createState() => _DissmissiableDemoState();
}

class _DissmissiableDemoState extends State<DismissibleDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    listItems = List<String>.generate(20, (index) => 'Item ${index + 1}');
  }

  List<String> listItems;

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarFactory.buildCenterAppBar('Dismissible Demo'),
      body: ListView.builder(
        itemCount: listItems.length,
        controller: ScrollController(),
        itemBuilder: (context, index) {
          final item = listItems[index];
          return Dismissible(
              key: Key(item),
              child: ListTile(
                title: Text(item),
                onTap: () {},
              ),
              onDismissed: (direction) {
                listItems.removeAt(index);
                _scaffoldKey.currentState
                    .showSnackBar(SnackBar(content: Text('第${index+1}个元素被删除了'), duration: Duration(milliseconds: 300),));
                    setState(() {
                      
                    });
              });
        },
      ),
    );
  }
}
