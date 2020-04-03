import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        final appName = 'Flutter案例';

        return  MaterialApp(
            title: 'Flutter案例',
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.lightGreen[600],
                accentColor: Colors.orange[600],
            ),
            home: MyStateHomePage(
                title: appName
            ),
        );
    }
}

class MyStateHomePage extends StatefulWidget {
    final String title;

    MyStateHomePage({Key key, @required this.title}) : super(key: key);

    @override
    _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyStateHomePage> {
    int _counter = 0;
    final title = 'Flutter样例';

    void _incrementCounter() {
        setState(() {
            _counter++;
        });
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(title),
            ),
            body: Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text(
                                '带背景颜色的文本样式',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .title,
                            ),
                            RaisedButton(
                                onPressed: _incrementCounter,
                                child: Text('点击加1'),
                            ),
                            Text(
                                '$_counter',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .title,
                            ),
                        ],
                    ),
                )
            ),
            floatingActionButton: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.grey),
                child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    child: Icon(Icons.add),
                ),
            )
        );
    }
}