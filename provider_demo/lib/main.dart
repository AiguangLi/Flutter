import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        final appName = 'Flutter案例';

        return MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => Counter()),
            ],
            child: MaterialApp(
                title: 'Flutter案例',
                theme: ThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.lightGreen[600],
                    accentColor: Colors.orange[600],
                ),
                home: MyHomePage(
                    title: appName
                ),
            )
        );
    }
}

class MyHomePage extends StatelessWidget {
    final String title;

    MyHomePage({Key key, @required this.title}) : super(key: key);

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('状态管理示例'),
                actions: <Widget>[
                    FlatButton(
                        child: Text('点击到子页面'),
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return SubPage();
                            })),
                    )
                ],
            ),
            body: Center(
                //监听的需要去掉listen: false参数，否则无法监听变化
                child: Text("${Provider.of<Counter>(context).count}"),  //获取计数器count的值
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    //触发事件的应该加上listen: false参数，否则会循环监听
                    Provider.of<Counter>(context, listen: false).increment();
                },
                child: Icon(Icons.add),
            ),
        );
    }
//   @override
//    _MyHomePageState createState() => _MyHomePageState();  //StateWidget必须实现createState
}

class SubPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('子页面'),
            ),
            body: Center(
                child: Text("${Provider.of<Counter>(context).count}"),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    //触发事件的应该加上listen: false参数，否则会循环监听
                    Provider.of<Counter>(context, listen: false).increment();
                },
                child: Icon(Icons.add),
            ),
        );
    }
}

//数据Model，通过Mixin ChangeNotifier可以通知监听者数据变化
class Counter with ChangeNotifier {
    int _count = 0;
    int get count => _count;

    void increment() {
        _count++;

        notifyListeners();
    }
}
