import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    List<Container> _buildGridTitleList(int count) {
      return List<Container>.generate(
          count,
          (int index) => Container(
                child: index % 2 == 0
                    ? Image.asset('images/benz.png')
                    : Image.asset('images/bmw.png'),
              ));
    }

    Widget buildGridView() {
      return GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: _buildGridTitleList(9),
      );
    }

    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('GridViewDemo'),
      body: Center(
        child: buildGridView(),
      ),
    );
  }
}
