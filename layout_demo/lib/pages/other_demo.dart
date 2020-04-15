import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class OtherDemo extends StatefulWidget {
  OtherDemo({Key key}) : super(key: key);

  @override
  _OtherDemoState createState() => _OtherDemoState();
}

class _OtherDemoState extends State<OtherDemo> {
  int typeIndex;
  final List<String> types = ['transform', 'baseline', 'offstage', 'wrap'];
  bool offstage;
  @override
  void initState() {
    super.initState();
    typeIndex = 0;
    offstage = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('${types[typeIndex]} Demo'),
      body: Center(
        child: getByTypeIndex(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            typeIndex = (++typeIndex) % types.length;
            print(typeIndex);
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget getByTypeIndex() {
    switch (typeIndex) {
      case 0:
        return getTransform();
        break;
      case 1:
        return getBaseline();
        break;
      case 2:
        return getOffStage();
        break;
      case 3:
        return getWrap();
        break;
      default:
        return null;
        break;
    }
  }

  Widget getTransform() {
    return Container(
      color: Colors.lightGreen,
      child: Transform(
        ///基于父组件的右边顶点绕Z轴旋转0.3弧度
        transform: Matrix4.rotationZ(0.3),
        alignment: Alignment.topRight,
        child: Container(
          child: Text('Flutter Matrix Transform'),
          color: Colors.cyanAccent,
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }

  Widget getBaseline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Baseline(
          baseline: 80.0,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            'Hello Flutter!',
            style: TextStyle(
              fontSize: 18.0,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
        Baseline(
          baseline: 80.0,
          baselineType: TextBaseline.alphabetic,
          child: Container(
            width: 40.0,
            height: 60.0,
            color: Colors.lightBlue,
          ),
        ),
        Baseline(
          baseline: 80.0,
          baselineType: TextBaseline.alphabetic,
          child: Text(
            'Hello Dart!',
            style: TextStyle(
              fontSize: 30.0,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
      ],
    );
  }

  Widget getOffStage() {
    return Column(
      children: <Widget>[
        ///通过offstage控制隐藏或显示
        Offstage(offstage: offstage, child: Text('Hi Flutter')),
        RaisedButton(
          child: Text('Hide and See'),
          onPressed: () {
            setState(() {
              offstage = !offstage;
            });
          },
        )
      ],
    );
  }

  Widget getWrap() {
    ///Wrap：当内容宽度不够时，自动换行
    return Wrap(
      spacing: 10.0,
      children: <Widget>[
        Chip(
          padding: EdgeInsets.all(2.0),
          avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen, child: Text('一')),
          label: Text('这是标签一'),
        ),
        Chip(
          padding: EdgeInsets.all(2.0),
          avatar:
              CircleAvatar(backgroundColor: Colors.lightBlue, child: Text('二')),
          label: Text('这是标签二'),
        ),
        Chip(
          padding: EdgeInsets.all(2.0),
          avatar:
              CircleAvatar(backgroundColor: Colors.lightBlue, child: Text('三')),
          label: Text('这是标签三'),
        ),
        Chip(
          padding: EdgeInsets.all(2.0),
          avatar:
              CircleAvatar(backgroundColor: Colors.lightBlue, child: Text('四')),
          label: Text('这是标签四'),
        ),
      ],
    );
  }
}
