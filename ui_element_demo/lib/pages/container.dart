import 'package:flutter/material.dart';

/*
Container属于一个容器组件，包含一个子Widget
本身支持alignment，padding等属性，以便调整子组件的布局
 */
class ContainerPage extends StatelessWidget {
    final String title;
    ContainerPage({Key key, this.title});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text( this.title)),
            body: Center(
                child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: new Border.all(
                            color: Colors.grey,
                            width: 4.0,
                        ),
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                    ),
                    child: Text(
                        'Container示例',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                    ),
                ),
            )
        );

  }
}