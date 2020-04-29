import 'package:flutter/material.dart';
import 'package:storage_demo/components/app_bar_factory.dart';
import 'package:storage_demo/database/user_dao.dart';
import 'package:storage_demo/models/user.dart';
import '../routers/route_manager.dart';

class SqliteDemo extends StatefulWidget {
  SqliteDemo({Key key}) : super(key: key);

  @override
  _SqliteDemoState createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  var userIdEditController = new TextEditingController();
  var nicknameController = new TextEditingController();
  var mobileController = new TextEditingController();
  //GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  int userId;
  String mobile;
  String nickname;

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('数据库演示'),
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
              getTextInput('请输入ID', (value) {
                userId = int.parse(value);
              }, userIdEditController, 'images/mobile.png', false, mobile),
              getTextInput('请输入手机号', (value) {
                mobile = value;
              }, mobileController, 'images/password.png', false, mobile),
              getTextInput('请输入昵称', (value) {
                nickname = value;
              }, nicknameController, 'images/password.png', false, nickname),
              Row(children: <Widget>[
                Expanded(
                  child: getTextButton('存储', Colors.lightBlue, () {
                  saveInfo();
                })),
                getTextButton('更新', Colors.lightBlue, () {
                  updateInfo();
                }),
                getTextButton('读取', Colors.lightGreen, () {
                  loadInfo();
                })
              ]),
              Row(
                children: <Widget>[
                  Expanded(
                    child: getTextButton('全部', Colors.lightGreen, () {
                      viewAllUser();
                    }),
                  ),
                  getTextButton('删除', Colors.redAccent, () {
                    deleteOne();
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateInfo() async {
    User user =
        User(id: userId, nickname: nickname, mobile: mobile, avatar: '');
    int updated = await UserDao.sharedInstance().updateUser(user);
    if (updated == 0) {
      print('Update database failed!');
    } else {
      print('Update database success! $updated row updated');
    }
  }

  void deleteOne() async {
    int deleted = await UserDao.sharedInstance().deleteByUserId(userId);
    if (deleted == 0) {
      print('Delete $userId failed!');
    } else {
      print('Delete $userId success! $deleted row deleted');
    }
  }

  void saveInfo() async {
    User user =
        User(id: userId, nickname: nickname, mobile: mobile, avatar: '');
    int inserted = await UserDao.sharedInstance().insertUser(user);
    if (inserted == 0) {
      print('Insert into database failed!');
    } else {
      print('Insert into database success!, userId = $inserted');
    }
  }

  void loadInfo() async {
    if (userId != null) {
      User user = await UserDao.sharedInstance().findByUserId(userId);
      if (user != null) {
        mobileController.text = user.mobile;
        nicknameController.text = user.nickname;
      } else {
        print('User not found!');
      }
    } else {
      print('Input userId please!');
    }
  }

  void viewAllUser() async {
    await RouteManager.router.navigateTo(context, '/users');
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
      //width: MediaQuery.of(context).size.width,
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
