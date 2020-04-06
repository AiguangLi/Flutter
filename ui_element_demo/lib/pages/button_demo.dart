import 'package:flutter/material.dart';

/*
Button包括图标按钮，凸起按钮，扁平按钮等
 */
class ButtonDemo extends StatefulWidget {
	final String title;
	ButtonDemo({Key key, this.title});
	
	_ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
	
	String _buttonType = '无点击';
	void updateButtonClicked(String buttonType) {
		setState(() {
			_buttonType = buttonType;
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('按钮组件示例')),
			body: Center(
				child: Column(
					children: <Widget>[
						IconButton(icon: Icon(Icons.refresh), onPressed: () {
							updateButtonClicked('点击图标按钮');
						}),
						RaisedButton(
							onPressed: () {
								updateButtonClicked('点击凸起按钮');
							},
							child: Text('RaisedButton'),
						),
						FlatButton(
							onPressed: () {
								updateButtonClicked('点击扁平按钮');
							},
							child: Text(
								'扁平按钮',
								style: TextStyle(
									color: Colors.lightGreen,
									fontSize: 16.0,
								),
							),
						),
						FloatingActionButton(
							child: Icon(Icons.computer),
							onPressed: () {
								updateButtonClicked('点击悬浮按钮');
							},
							hoverColor: Colors.lightGreen,
							focusColor: Colors.greenAccent,
						),
						Text(
							'$_buttonType',
							style: TextStyle(
								color: Colors.lightBlue,
								fontSize: 20.0,
								fontWeight: FontWeight.bold
							),
						)
					],
				),
			)
		);
		
	}
}