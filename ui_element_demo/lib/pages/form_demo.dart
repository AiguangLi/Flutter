import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
	final String title;
	FormDemoPage({Key key, this.title});
	
	@override
	_LoginStatePage createState() => _LoginStatePage();
}

class _LoginStatePage extends State<FormDemoPage> {
	GlobalKey<FormState> loginKey = GlobalKey<FormState>();
	
	String username;
	String password;
	String _loginTip = '请输入账号密码';
	
	void login() {
		var loginForm = loginKey.currentState;
		
		if (loginForm.validate()) {
			loginForm.save();
			setState(() {
				_loginTip = '信息验证通过';
			});
		} else {
			setState(() {
				_loginTip = '信息验证失败';
			});
		}
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('Form表单示例')),
			body: Container(
				padding: const EdgeInsets.all(20.0),
				child: Form(
					key: loginKey,
					child: Column (
						children: <Widget>[
							TextFormField(
								decoration: InputDecoration(
									labelText: '请输入用户名',
								),
								onSaved: (value) {
									username = value;
								}, //当调用Form的save方法时会调用该方法获取最终的表单内容
								onFieldSubmitted: (value) {
									print('用户名：$value');
								},
								validator: (value) {
									if (value.trim().length < value.length) {
										return '用户名两边不可以有空字符';
									}
									return value.length < 3 ? '用户名至少3位' : null;
								},
							),
							TextFormField(
								decoration: InputDecoration(
									labelText: '请输入密码',
								),
								obscureText: true,  //输入内容是否不可见
								onSaved: (value) {
									password = value;
								}, //当调用Form的save方法时会调用该方法获取最终的表单内容
								onFieldSubmitted: (value) {
									print('密码：$value');
								},
								validator: (value) {
									return value.length < 6 ? '密码至少需要6位' : null;
								},
							),
							SizedBox (
								width: MediaQuery.of(context).size.width - 40.0,
								height: 44.0,
								child: RaisedButton(
									child: Text(
										'登录',
										style: TextStyle (
											color: Colors.white,
										),
									),
									onPressed: login,
									color: Colors.lightBlue,
								),
							),
							Text (
								'$_loginTip',
							),
						],
					)
				),
			),
		);
  	}
}