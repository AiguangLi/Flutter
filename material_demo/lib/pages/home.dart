import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
	HomePage({Key key, this.title}) : super(key: key);
	final String title;
	
	@override
	_HomePageState createState() => _HomePageState();
}

enum ConferenceItem {AddMember, LockConference, ModifyLayout, TurnoffAll}

class _HomePageState extends State<HomePage> {
	int _counter = 0;
	int _selectedIndex = 0;
	String _message = '';
	String _dialogButtonStr = '';
	
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
				leading: IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: () {
					Navigator.pop(context);
				},),  //左上角前置图标
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
					FlatButton(
						//icon: Icon(Icons.menu),
						//tooltip: '更多',
						color: Colors.lightBlue,
						child: PopupMenuButton<ConferenceItem> (
							icon: Icon(Icons.menu, color: Colors.white),
							onSelected: (ConferenceItem result) {
								print('PopupMenu Selected: $result');
							},
							itemBuilder: (BuildContext context) =>
								<PopupMenuEntry<ConferenceItem>> [
									const PopupMenuItem<ConferenceItem>(
										value: ConferenceItem.AddMember,
										child: Text('添加成员'),
									),
									const PopupMenuItem<ConferenceItem>(
										value: ConferenceItem.LockConference,
										child: Text('锁定会议'),
									),
									const PopupMenuItem<ConferenceItem>(
										value: ConferenceItem.ModifyLayout,
										child: Text('修改布局'),
									),
									const PopupMenuItem<ConferenceItem>(
										value: ConferenceItem.TurnoffAll,
										child: Text('挂断所有'),
									),
								],
						),
						onPressed: () {
							print('点击添加按钮');
						},
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
						Text(
							'简单对话框点击：$_message',
						),
						Text(
							'交互对话框点击：$_dialogButtonStr',
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
			//需要使用builder构建才可以使用Scaffold.of(context)找到对应的Scaffold，否则会抛异常
			floatingActionButton: Builder(builder: (BuildContext context) {
				return FloatingActionButton(
					onPressed: () {
						_incrementCounter();
						Scaffold.of(context).showSnackBar(SnackBar(
							content: Text('点击了FlatActionButton'),
						));
					},
					tooltip: 'Go to User Page',
					child: Icon(Icons.account_box),
				);
			}),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,// This trailing comma makes auto-formatting nicer for build methods.
		);
	}
	
	Future _showSimpleDialog(String title, String message) async {
		//SimpleDialog点击完成后，会把结果放到option里
		final option = await showDialog<String>(
			context: context,
			builder: (BuildContext context) => SimpleDialog(
				title: Text(title),
				children: <Widget>[
					SimpleDialogOption(
						onPressed: () {
							Navigator.of(context).pop(message);
						},
						child: Text(message),
					)
				],
			),
		);
		
		setState(() {
			_message = option;
		});
	}
	
	Future _showAlertDialog(String title, String message) async {
		final option = await showDialog<String>(
			context: context,
			builder: (BuildContext context) => AlertDialog(
				title: Text(title),
				content: SingleChildScrollView(
					child: ListBody(
						children: <Widget>[
							Text(message)
						],
					),
				),
				actions: <Widget>[
					FlatButton(
						child: Text('确定', style: TextStyle(color: Colors.lightBlue)),
						onPressed: () {
							Navigator.of(context).pop('OK');
						},
					),
					FlatButton(
						child: Text('取消', style: TextStyle(color: Colors.grey)),
						onPressed: () {
							Navigator.of(context).pop('Cancel');
						},
					),
				],
			),
		);
		
		setState(() {
			_dialogButtonStr = option;
		});
	}
	
	void _onItemTapped(index) {
		setState(() {
			_selectedIndex = index;
		});
		
		switch(index) {
			case 1:
				_showSimpleDialog('底部导航点击提示', '点击了第$index个');
				break;
			case 2:
				_showAlertDialog('确认删除', '删除后无法恢复，请谨慎操作！');
				break;
			default:
				break;
		}
	}
	
	
	
	
}
