import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertDialogPage extends StatefulWidget {
	final String title;
	AlertDialogPage({Key key, this.title});
	
	_AlertDialogState createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialogPage> {
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(
				title: Text(widget.title, style: TextStyle(color: Colors.white)),
				centerTitle: true,
				backgroundColor: Colors.lightBlue,
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Builder(builder: (BuildContext context) {
							return FlatButton (
								child: Text('点击显示对话框', style: TextStyle(color: Colors.white)),
								shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
								color: Colors.lightBlue,
								onPressed: () {
									_showAlertDialog('提示', ['是否确认删除？', '删除后不可恢复']);
								},
							);
						},),
						CupertinoButton(
							child: Text('iOS风格按钮', style: TextStyle(color: Colors.white)),
							color: Colors.lightBlue,
							onPressed: () {},
							borderRadius: BorderRadius.all(Radius.circular(4.0)),
						)
					],
				),
			),
		);
  	}
  	
	Future _showAlertDialog(String title, List<String> message) async {
		final option = await showDialog<String>(
			context: context,  //State才有全局的context
			builder: (BuildContext context) => CupertinoAlertDialog(
				title: Text(title),
				content: SingleChildScrollView(
					child: ListBody(
						children: message.map((item) =>
							Text(item)
						).toList(),
					),
				),
				actions: <Widget>[
					CupertinoDialogAction(
						child: Text('确定', style: TextStyle(color: Colors.lightBlue)),
						onPressed: () {
							Navigator.of(context, rootNavigator: true).pop(); //将对话框隐藏
						},
					),
					CupertinoDialogAction(
						child: Text('取消', style: TextStyle(color: Colors.grey)),
						onPressed: () {
							Navigator.of(context, rootNavigator: true).pop(); //将对话框隐藏
						},
					),
				],
			),
		);
	}
}