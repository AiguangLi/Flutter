import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class StackAlignmentDemo extends StatefulWidget {
  StackAlignmentDemo({Key key}) : super(key: key);

  @override
  _StackAlignmentDemoState createState() {
    return _StackAlignmentDemoState();
  }
}

class _StackAlignmentDemoState extends State<StackAlignmentDemo> {
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

  String demoType;
  int demoIndex;
  List<String> types = ['alignment', 'positioned', 'indexed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Stack Demo'),
      body: Center(
        child: getAlignment(),
      ),
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

  Widget getAlignment() {
    switch (demoType) {
      case 'alignment':
        return getAlignmentStack();
        break;
      case 'positioned':
        return getPostionedStack();
        break;
      case 'indexed':
        return getIndexedStack();
        break;
      default:
        return null;
        break;
    }
  }

  Stack getPostionedStack() {
    return Stack(
      children: <Widget>[
        Image.network(
            'http://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1587478047&t=13f3006aaac88bc1dec10329fe25b827'),
        Positioned(
          bottom: 50.0,
          right: 50.0,
          child: Text(
            'Hi Flutter',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Stack getAlignmentStack() {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('images/benz.png'),
          radius: 80.0,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black54),
          child: Text(
            '梅赛德斯-奔驰',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  IndexedStack getIndexedStack() {
    return IndexedStack(
      index: 0,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('images/benz.png'),
          radius: 80.0,
        ),
        Container(
          child: Text(
            'Hi Flutter!',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
          ),
        ),
      ],
    );
  }
}
