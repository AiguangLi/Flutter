import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'message_page.dart';

class TabPage extends StatefulWidget {
	final String title;
	TabPage({Key key, this.title});
	
	_TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
	@override
  	Widget build(BuildContext context) {
		return CupertinoTabScaffold (
			tabBar: CupertinoTabBar(
				backgroundColor: CupertinoColors.lightBackgroundGray,
				items: [
					BottomNavigationBarItem(
						icon: Icon(CupertinoIcons.home),
						title: Text('首页'),
					),
					BottomNavigationBarItem(
						icon: Icon(CupertinoIcons.conversation_bubble),
						title: Text('消息'),
					),
				],
			),
			tabBuilder: (context, index) {
				return CupertinoTabView(
					builder: (context) {
						switch (index) {
							case 0:
								return HomePage();
								break;
							case 1:
								return MessagePage();
								break;
							default:
								return Container();
						}
					},
				);
			},
		);
  	}
}