import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
	final String title;
	PageList({Key key, this.title});
	
	final List<String> pageNames =['1. AppBar及底部导航框架', '2. 简单Tabbar',
								   '3. 带图标的Tabbar', '4. 侧边栏抽屉'];
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(this.title, style: TextStyle(color: Colors.white)),
				centerTitle: true,
				backgroundColor: Colors.lightBlue,
			),
			body: ListView.builder(
				scrollDirection: Axis.vertical,
				itemCount: pageNames.length,
				itemBuilder: (context, index) {
					return ListTile(
						title: Text(pageNames[index]),
						onTap: () {
							routeToPage(context, index);
						},
					);
				},
			),
		);
  	}
  	
  	void routeToPage(BuildContext context, int index) {
		switch(index) {
			case 0:
				Navigator.pushNamed(context, '/home');
				break;
			case 1:
				Navigator.pushNamed(context, '/tabbar');
				break;
			case 2:
				Navigator.pushNamed(context, '/tabbar_items');
				break;
			case 3:
				Navigator.pushNamed(context, '/drawer');
				break;
			default:
				break;
		}
	}
}