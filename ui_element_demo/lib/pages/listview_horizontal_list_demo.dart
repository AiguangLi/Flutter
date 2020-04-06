import 'package:flutter/material.dart';

class HorizontalListDemoPage extends StatelessWidget {
	final String title;
	HorizontalListDemoPage({Key key, this.title});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Text(this.title),
			),
			body: Container (
				margin: EdgeInsets.symmetric(vertical: 10.0),
				height: 100,
				child: ListView (
					scrollDirection: Axis.horizontal,
					children: <Widget>[
						Container (
							width: 200,
							height: 80,
							decoration: BoxDecoration(
								image: DecorationImage(
									image: NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4099493327,2236798276&fm=26&gp=0.jpg'),
									fit: BoxFit.cover,
								),
								shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
								borderRadius: new BorderRadius.all(
									const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
								),
							),
						),
						Container (
							width: 200,
							height: 80,
							decoration: BoxDecoration(
								image: DecorationImage(
									image: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1883407631,4056411171&fm=26&gp=0.jpg'),
									fit: BoxFit.cover,
								),
								shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
								borderRadius: new BorderRadius.all(
									const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
								),
							),
						),
						Container (
							width: 200,
							height: 80,
							child: Column (
								children: <Widget>[
									Text('第一行'),
									Text('第二行'),
									Text('第三行'),
								],
							),
							decoration: BoxDecoration(
								color: Colors.lightBlue,
								shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
								borderRadius: new BorderRadius.all(
									const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
								),
							),
						),
					],
				),
			),
		);
  	}
}