import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class BoxDemo extends StatefulWidget {
  BoxDemo({Key key}) : super(key: key);
  _BoxDemoState createState() => _BoxDemoState();
}

class _BoxDemoState extends State<BoxDemo> {
  String demoType;
  int demoIndex;
  final List<String> types = ['overflow', 'sized', 'constrainted', 'limitted'];

  @override
  void initState() {
    super.initState();
    demoIndex = 0;
    demoType = types[0];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Box Demo'),
      body: getCurrentWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            demoIndex = (++demoIndex) % types.length;
            demoType = types[demoIndex];
          });
        },
      ),
    );
  }

  Widget getCurrentWidget() {
    switch (demoType) {
      case 'overflow':
        return getOverflowBox();
        break;
      case 'sized':
        return getSizedBox();
        break;
      case 'constrainted':
        return getConstaintedBox();
        break;
      case 'limitted':
        return getLimittedBox();
        break;
      default:
        return null;
        break;
    }
  }

  Widget getOverflowBox() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.lightGreen,
      padding: const EdgeInsets.all(50.0),
      child: OverflowBox(
        alignment: Alignment.topLeft,
        maxWidth: 400,
        maxHeight: 400,
        child: Container(
          color: Colors.lightBlue,
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  Widget getSizedBox() {
    return SizedBox(
      ///强制子组件宽度
      width: 200,

      ///强制子组件高度
      height: 200,
      child: const Card(
        child: Text(
          'Sized Box',
          style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getConstaintedBox() {
    return ConstrainedBox(
      constraints: const BoxConstraints(

          ///限制最小最大宽高，子元素超出后自动裁剪
          minWidth: 100.0,
          minHeight: 100.0,
          maxHeight: 300.0,
          maxWidth: 300.0),
      child: Container(
        color: Colors.lightBlue,
        width: 100,
        height: 1000,
      ),
    );
  }

  Widget getLimittedBox() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.orangeAccent,
          width: 150.0,
          child: Text('150'),
        ),
        LimitedBox(
          maxWidth: 200.0,
          child: Container(
            width: 300.0,
            color: Colors.lightGreen,
            child: Text('ori: 300, limit: 200'),
          ),
        ),
      ],
    );
  }
}
