import 'package:flutter/material.dart';

class ListTileDemoPage extends StatelessWidget {
	final String title;
	ListTileDemoPage({Key key, this.title});
	
	final List<ListTileVO> listItems = [
		ListTileVO(title: '消息', iconData: Icons.message, subTitle: '查看您的消息'),
		ListTileVO(title: '搜索', iconData: Icons.search, subTitle: '搜索历史记录'),
		ListTileVO(title: '设置', iconData: Icons.settings, subTitle: '设置应用参数'),
		ListTileVO(title: '账户', iconData: Icons.account_box, subTitle: '查看您的账户'),
		ListTileVO(title: '关于', iconData: Icons.help, subTitle: '查看应用信息'),
		ListTileVO(title: '消息', iconData: Icons.message, subTitle: '查看您的消息'),
		ListTileVO(title: '搜索', iconData: Icons.search, subTitle: '搜索历史记录'),
		ListTileVO(title: '设置', iconData: Icons.settings, subTitle: '设置应用参数'),
		ListTileVO(title: '账户', iconData: Icons.account_box, subTitle: '查看您的账户'),
		ListTileVO(title: '关于', iconData: Icons.help, subTitle: '查看应用信息'),
	];
	
	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Text(this.title),
			),
			body: ListView (
				children: listItems.map((item) {
					return ListTile(
						title: Text(item.title),
						leading: Icon(item.iconData),
						subtitle: Text(item.subTitle),
						contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
					);
				}).toList(),
			),
		);
  	}
}

class ListTileVO {
	String title;
	String subTitle;
	IconData iconData;
	
	ListTileVO({this.title, this.iconData, this.subTitle});
}