import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:message_app/home/view_model/login_store.dart';
import 'package:plugins/components/app_bar_factory.dart';
import 'package:plugins/plugins.dart';
import 'package:provider/provider.dart';
import 'package:keyboard_actions/keyboard_action.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginStore(),
      lazy: false,
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  _LoginView({Key key}) : super(key: key);

  @override
  __LoginViewState createState() => __LoginViewState();
}

class __LoginViewState extends State<_LoginView> {
  final FocusNode usernameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('登录'),
      body: _getWidgetWithKeyboardAction(),
    );
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        _getKeyboardAction(usernameNode),
        _getKeyboardAction(passwordNode),
      ],
    );
  }

  KeyboardAction _getKeyboardAction(FocusNode focusNode) {
    return KeyboardAction(
      focusNode: focusNode,
      toolbarButtons: [
        //button 1
        (node) {
          return GestureDetector(
            onTap: () => node.unfocus(),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "关闭",
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        },
        //button 2
        (node) {
          return GestureDetector(
            onTap: () => node.unfocus(),
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "完成",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      ],
    );
  }

  Widget _getWidgetWithKeyboardAction() {
    final store = Provider.of<LoginStore>(context);
    return KeyboardActions(
      config: _buildConfig(context),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Image.asset(
                'images/app_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              focusNode: usernameNode,
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "输入用户名",
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              focusNode: passwordNode,
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "输入密码",
              ),
            ),
            FlatButton(
              onPressed: () {
                store.login(usernameController.text, passwordController.text);
                if (store.isLogined) {
                  RouteManager.router.navigateTo(context, '/home', replace: true);
                }
              },
              child: Text('登录'),
            ),
          ],
        ),
      ),
    );
  }
}
