import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
	final String title;
	HomePage({Key key, this.title});
	
	@override
  	Widget build(BuildContext context) {
    	return CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text('首页'),
			),
			child: Center (
				child: Text('首页'),
			),
		);
  	}
}