import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MessagePage extends StatelessWidget {
	final String title;
	MessagePage({Key key, this.title});
	
	@override
	Widget build(BuildContext context) {
		return CupertinoPageScaffold(
			navigationBar: CupertinoNavigationBar(
				middle: Text('消息'),
				trailing: Icon(CupertinoIcons.add),
				leading: Icon(CupertinoIcons.create),
			),
			child: Center (
				child: Text('消息'),
			),
			
		);
	}
}