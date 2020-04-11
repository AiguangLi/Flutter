import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
	final String title;
	PageList({Key key, this.title});
	
	final List<String> pageNames =['1. ActivityIndicator', '2. AlertDialog'];
	
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
				Navigator.pushNamed(context, '/indicator');
				break;
			case 1:
				Navigator.pushNamed(context, '/alert_dialog');
				break;
			default:
				break;
		}
	}
}