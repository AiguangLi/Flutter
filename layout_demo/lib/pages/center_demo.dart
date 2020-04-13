import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
class CenterDemo extends StatefulWidget {
	_CenterDemoState createState() => _CenterDemoState();
}

class _CenterDemoState extends State<CenterDemo> {
	@override
	void initState() {
		super.initState();
		appBarTitle = '2. Center Demo';
	}
	
	String appBarTitle;
	
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBarFactory.buildDefaultAppBar(appBarTitle),
			body: Center (
				child: Text(
					'Hello Flutter!', 
					style: TextStyle(fontWeight: FontWeight.bold),
				),
			),
		);
	}
}