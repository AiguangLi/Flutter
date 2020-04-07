import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
	HomePage({Key key, this.title}) : super(key: key);
	final String title;
	
	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	int _counter = 0;
	int _selectedIndex = 0;
	
	void _incrementCounter() {
		setState(() {
			_counter++;
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title,
					style: TextStyle(
						color: Colors.white,
					),
				),
				leading: Icon(Icons.home, color: Colors.white,),  //左上角前置图标
				centerTitle: true,
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.search),
						tooltip: '搜索',
						onPressed: () {
							print('点击搜索按钮');
						},
						color: Colors.white,
					),
					IconButton(
						icon: Icon(Icons.add),
						tooltip: '添加',
						onPressed: () {
							print('点击添加按钮');
						},
						color: Colors.white,
					),
				],
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							'首页：$_selectedIndex',
						),
						Text(
							'$_counter',
							style: Theme.of(context).textTheme.display1,
						),
					],
				),
			),
			bottomNavigationBar: BottomNavigationBar(
				items: <BottomNavigationBarItem> [
					BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('消息')),
					BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
					BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('我的')),
				],
				currentIndex: _selectedIndex,
				fixedColor: Colors.blue,
				onTap: _onItemTapped,
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					_incrementCounter();
					Navigator.pushNamed(context, '/user');
				},
				tooltip: 'Go to User Page',
				child: Icon(Icons.account_box),
			),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,// This trailing comma makes auto-formatting nicer for build methods.
		);
	}
	
	void _onItemTapped(index) {
		setState(() {
			_selectedIndex = index;
		});
	}
}
