import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
	final String title;
	DrawerDemo({Key key, this.title});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(this.title, style: TextStyle(color: Colors.white)),
				centerTitle: true,
				backgroundColor: Colors.lightBlue,
				
			),
			body: Center(
				child: Column (
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(this.title),
						RaisedButton(child: Text('返回'), onPressed: () {
							Navigator.pop(context);
						},)
					],
				),
			),
			drawer: Drawer(
				child: ListView(
					children: <Widget>[
						UserAccountsDrawerHeader(
							accountName: Text(
								'LiOS'
							),
							accountEmail: Text(
								'aiguang.li@qq.com'
							),
							currentAccountPicture: CircleAvatar(
								backgroundImage: AssetImage('images/auto.png'),
							),
							onDetailsPressed: () {},
							otherAccountsPictures: <Widget>[
								Container(
									child: Image.asset('images/auto_other.png'),
								)
							],
						),
						ListTile(
							leading: CircleAvatar(child:Icon(Icons.color_lens)),
							title: Text('个性装扮'),
						),
						ListTile(
							leading:  CircleAvatar(child:Icon(Icons.photo)),
							title: Text('我的相册'),
						),
						ListTile(
							leading:  CircleAvatar(child:Icon(Icons.wifi)),
							title: Text('免流量'),
						),
					],
				),
			),
		);
  	}
}