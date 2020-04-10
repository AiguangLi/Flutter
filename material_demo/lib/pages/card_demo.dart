import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
	final String title;
	CardDemo({Key key, this.title});
	
	@override
  	Widget build(BuildContext context) {
		
		var card = SizedBox (
			height: 200,
			child: Card(
				child: Column(
					children: <Widget>[
						ListTile (
							title: Text('海口市龙华区景瑞大厦', style: TextStyle(fontWeight: FontWeight.bold)),
							subtitle: Text('景瑞大厦A座19楼智慧城科技'),
							leading: Icon(
								Icons.home,
								color: Colors.lightBlue,
							),
						),
						Divider(),
						ListTile (
							title: Text('海口市美兰区和平大道35号', style: TextStyle(fontWeight: FontWeight.bold)),
							subtitle: Text('蓝岛康城2楼智慧城科技'),
							leading: Icon(
								Icons.contacts,
								color: Colors.lightBlue,
							),
						),
						Divider(),
					],
				),
			),
		);
		
		return Scaffold (
			appBar: AppBar(
				title: Text(this.title, style: TextStyle(color: Colors.white)),
				centerTitle: true,
			),
			body: Center (
				child: card,
			),
		);
  	}
}