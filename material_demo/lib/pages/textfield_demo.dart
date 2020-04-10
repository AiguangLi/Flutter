import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
	final String title;
	TextFieldDemo({Key key, this.title});
	
	@override
  	Widget build(BuildContext context) {
		TextEditingController textEditingController = TextEditingController();
		textEditingController.addListener(() {
			print('输入文字内容为：${textEditingController.text}');
		});
		
		return Scaffold(
			appBar: AppBar(
				title: Text(this.title, style: TextStyle(color: Colors.white)),
				centerTitle: true,
			),
			body: Center(
				child: Padding(
					padding: const EdgeInsets.all(20.0),
					child: TextField(
						controller: textEditingController,
						maxLength: 20,
						maxLines: 1,
						autocorrect: true,
						autofocus: true,
						obscureText: false,
						textAlign: TextAlign.center,
						style: TextStyle(
							fontSize: 20.0,
							color: Colors.lightBlue
						),
						onChanged: (text) {
							print('内容发生了改变，当前内容：$text');
						},
						onSubmitted: (text) {
							print('内容已提交，当前内容：$text');
						},
						enabled: true,
						decoration: InputDecoration(
							fillColor: Colors.grey.shade200,
							filled: true,
							helperText: '请输入用户名',
							prefixIcon: Icon(Icons.person),
							suffixText: '用户名'
						),
					),
				),
			),
		);
  	}
}