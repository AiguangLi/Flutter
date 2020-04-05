import 'package:flutter/material.dart';

/*
Icon即图标，支持系统图标，可添加文本，但不可交互
 */
class IconDemo extends StatelessWidget {
	final String title;
	IconDemo({Key key, this.title});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text( this.title)),
			body: Center(
				child: Column(
					children: <Widget>[
						Icon(
							Icons.phone,
							color: Colors.lightGreen,
							size: 30.0,
						),
						ImageIcon(
							AssetImage('images/bmw.png'),
							color: Colors.blue,
							size: 40.0,
						),
						Icon(
							IconData(
								0xe921,
								fontFamily: 'myIconFont',
							),
							color: Colors.orange,
						),
					],
				),
			)
		);
		
	}
}