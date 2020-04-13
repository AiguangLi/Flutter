import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
class AlignDemo extends StatefulWidget {
	_AlignDemoState createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignDemo> {
	@override
	void initState() {
		super.initState();
		//ToDo: Add initialization code below
	}
	
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBarFactory.buildCenterAppBar('Align Demo'),
			body: Stack(
				children: <Widget>[
					Align(
						alignment: FractionalOffset.topLeft,
						child: Image.asset('images/bmw.png', width: 80.0, height: 80.0,),
					),
					Align(
						alignment: FractionalOffset.topRight,
						child: Image.asset('images/benz.png', width: 80.0, height: 80.0,),
					),
					Align(
						alignment: FractionalOffset.center,
						child: Image.asset('images/benz.png', width: 80.0, height: 80.0,),
					),
					Align(
						alignment: FractionalOffset.bottomRight,
						child: Image.asset('images/benz.png', width: 80.0, height: 80.0,),
					),
					Align(
						///通过系数可以调整显示在某一方向的比例
						alignment: FractionalOffset(0.0, 0.9),
						child: Image.asset('images/bmw.png', width: 80.0, height: 80.0,),
					),
				],
			),
		);
	}
}