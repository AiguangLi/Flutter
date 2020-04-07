import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
	UserPage({Key key, this.title}) : super(key: key);
	final String title;
	
	@override
	_UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
	int _counter = 0;
	
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
				centerTitle: true,
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							'You have pushed the button this many times:',
						),
						Text(
							'$_counter',
							style: Theme.of(context).textTheme.display1,
						),
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					_incrementCounter();
					Navigator.pop(context);
				},
				tooltip: 'Increment',
				child: Icon(Icons.arrow_back),
			), // This trailing comma makes auto-formatting nicer for build methods.
		);
	}
}
