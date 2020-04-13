import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndicatorPage extends StatefulWidget {
	final String title;
	IndicatorPage({Key key, this.title});
	
	_IndicatorPageState createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
	bool animating = false;
	
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text(widget.title, style: TextStyle(color: Colors.white))),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						CupertinoActivityIndicator(radius: 40.0, animating: animating),
						SizedBox(height:20.0),
						FlatButton(
							child: Text('点击停止/开启动画', style: TextStyle(color: Colors.white)),
							shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
							color: Colors.lightBlue,
							onPressed: () {
								setState(() {
									animating = ! animating;
								});
							},
						)
					],
				)
			),
		);
	}
}