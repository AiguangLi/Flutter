import 'package:flutter/material.dart';

class TabBarItemsDemo extends StatelessWidget {
	final String title;
	TabBarItemsDemo({Key key, this.title});
	
	static const List<ItemView> tabs = const <ItemView>[
		const ItemView(title: '自驾', icon: Icons.directions_car),
		const ItemView(title: '自行车', icon: Icons.directions_bike),
		const ItemView(title: '轮船', icon: Icons.directions_boat),
		const ItemView(title: '公交车', icon: Icons.directions_bus),
		const ItemView(title: '火车', icon: Icons.directions_railway),
		const ItemView(title: '步行', icon: Icons.directions_walk),
	];
	
	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: tabs.length,
			child: Scaffold(
				appBar: AppBar(
					title: Text('TabBar示例'),
					centerTitle: true,
					bottom: TabBar(
						isScrollable: true,
						tabs: tabs.map((ItemView item) {
							return Tab(
								text: item.title,
								icon: Icon(item.icon),
							);
						}).toList(),
					),
				),
				body: TabBarView(
					children: tabs.map((ItemView item) {
						return Padding(
							padding: const EdgeInsets.all(16.0),
							child: SelectedView(item: item),
						);
					}).toList()
				),
			),
		);
	}
}

class ItemView {
	final String title;
	final IconData icon;
	
	const ItemView({this.title, this.icon});
}

class SelectedView extends StatelessWidget{
	final ItemView item;
	const SelectedView({Key key, this.item}): super(key: key);
	
	@override
	Widget build(BuildContext context) {
		final TextStyle textStyle = Theme.of(context).textTheme.display1;
    	return Card(
			color: Colors.white,
			child: Center(
				child: Column(
					mainAxisSize: MainAxisSize.min,  //垂直方向最小化
					crossAxisAlignment: CrossAxisAlignment.center, //水平方向居中对齐
					children: <Widget>[
						Icon(item.icon, size: 100, color: textStyle.color),
						Text(item.title, style: textStyle)
					],
				),
			),
		);
  	}
}