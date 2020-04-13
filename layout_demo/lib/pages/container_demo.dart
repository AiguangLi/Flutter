import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
class ContainerDemo extends StatefulWidget {
	_ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
	@override
	void initState() {
		super.initState();
		
		appBatTitle = 'ContainerDemo';
	}
	
	String appBatTitle;
	
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBarFactory.buildCenterAppBar(appBatTitle),
			body: Container(
				decoration: BoxDecoration(
					color: Colors.grey,
				),
				child: Column(
					children: <Widget>[
						Row (
							children: <Widget>[
								getSubItem('images/benz.png'),
								getSubItem('images/benz.png'),
							],
						),
						Row(
							children: <Widget>[
								getSubItem('images/benz.png', 20.0),
								getSubItem('images/benz.png', 20.0),
							],
						),
						RaisedButton(
							child: Text('更换AppBar标题'),
							onPressed: () {
								setState(() {
									appBatTitle = '1. Container Demo';
								});
							},
						),
					],
				),
			),
		);
	}
	
	Widget getSubItem(String assetPath, [double padding]) {
		return Expanded(
			child: Container(
				padding: EdgeInsets.all(padding ?? 6.0),
				width: 150,
				height: 150,
				decoration: BoxDecoration(
					border: Border.all(width: 1.0, color: Colors.blueGrey),
					borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
				),
				margin: const EdgeInsets.all(10.0),
				child: Image.asset(assetPath),
			),
		);
	}
}