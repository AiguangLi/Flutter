import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
/// FittedBox的填充模式：
/// none：无模式，保持原样
/// fill：拉升填满整个容器
/// contain：等宽高比填充，内容不超过容器范围
/// cover：按原始尺寸填充，可能超出容器范围
/// fitWidth：填满容器宽度
/// fitHeight：填满容器高度
/// scaleDown：缩放到容器可以容纳
class FittedBoxDemo extends StatefulWidget {
	_FittedBoxDemoState createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
	@override
	void initState() {
		super.initState();
		
		appBarTitle = '4. Fitted Box Demo';
	}
	
	String appBarTitle;
	
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBarFactory.buildCenterAppBar(appBarTitle),
			body: Container(
				width: 200,
				height: 200,
				color: Colors.lightGreen,
				child: FittedBox(
					///包含内容即可
					fit: BoxFit.contain,
					alignment: Alignment.topLeft,
					child: Container(
						color: Colors.lightBlue,
						child: Text(
							'Hello Flutter',
							style: TextStyle(color: Colors.white),
						),
					),
				),
			),
		);
	}
}