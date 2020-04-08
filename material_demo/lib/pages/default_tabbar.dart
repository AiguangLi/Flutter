import 'package:flutter/material.dart';

class DefaultTabBarDemo extends StatelessWidget {
	final String title;
	DefaultTabBarDemo({Key key, this.title});
	
	final List<Tab> myTabs = [
		Tab(text: '选项卡一'),
		Tab(text: '选项卡二',)
	];
	
	@override
	Widget build(BuildContext context) {
    	return DefaultTabController(
			length: myTabs.length,
			child: Scaffold(
				appBar: AppBar(
					title: Text('TabBar示例'),
					centerTitle: true,
					bottom: TabBar(
						tabs: myTabs,
					),
				),
				body: TabBarView(
					children: myTabs.map((Tab tab) {
						return Center(child: Text(tab.text));
					}).toList()
				),
			),
		);
  	}
}