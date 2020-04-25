import 'package:flutter/material.dart';
import 'package:storage_demo/components/app_bar_factory.dart';
import 'package:storage_demo/utils/shared_storage.dart';

class SharedStorageDemo extends StatefulWidget {
  SharedStorageDemo({Key key}) : super(key: key);

  @override
  _SharedStorageDemoState createState() => _SharedStorageDemoState();
}

class _SharedStorageDemoState extends State<SharedStorageDemo> {
  var mobileEditController = new TextEditingController();
  var passwordEditController = new TextEditingController();
  //GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  String mobile;
  String password;

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('请先登录'),
      body: Center(
        child: Container(
          height: 500,
          ///使用Column虽然效果一样，但是键盘弹出的时候可能导致布局约束不满足
          ///因此应当使用ListView
          child: ListView(
            scrollDirection: Axis.vertical,
            controller: new ScrollController(),
            children: <Widget>[
              getLogo(),
              Container(height: 20),
              getTextInput('请输入手机号', (value) {
                mobile = value;
              }, mobileEditController, 'images/mobile.png', false, mobile),
              getTextInput('请输入密码', (value) {
                password = value;
              }, passwordEditController, 'images/password.png', true, password),
              getTextButton('登录', Colors.lightBlue, () {
                saveInfo();
              }),
            ],
          ),
        ),
      ),
    );
  }

  void saveInfo() {
    SharedStorage.saveStringForKey('mobile', mobile);
    SharedStorage.saveStringForKey('password', password);
  }

  void loadInfo() async {
    mobile = await SharedStorage.getStringForKey('mobile');
    password = await SharedStorage.getStringForKey('password');

    //print('mobile: $mobile');
    //print('password: $password');

    mobileEditController.text = mobile;
    passwordEditController.text = password;
  }

  Widget getLogo() {
    return Center(
      child: ClipOval(
        child: SizedBox(
          child: Image.asset(
            'images/logo.png',
            fit: BoxFit.fitWidth,
          ),
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Widget getTextInput(
      String placeholder, Function onChanged, TextEditingController controller,
      [String iconPath,
      bool isPassword = false,
      String initialText,
      String label]) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: placeholder,
          labelText: label,
          prefixIcon: iconPath == null
              ? null
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(iconPath, width: 12, height: 12),
                ),
        ),
      ),
    );
  }

  Widget getTextButton(String title, Color bgColor, Function onPressed) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
