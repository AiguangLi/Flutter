import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';
import 'package:plugins/plugins.dart';

class AppHomePage extends StatefulWidget {
  AppHomePage({Key key}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _currentIndex = 0;

  Widget _currentPage() {
    return Text(_currentIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Message App',
          withActions: _getAppBarWidgets()),
      body: _currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          _getBottomNavItem('聊天', 'images/message_normal.png',
              'images/message_pressed.png', 0),
          _getBottomNavItem('联系人', 'images/contact_normal.png',
              'images/contact_pressed.png', 1),
          _getBottomNavItem(
              '我的', 'images/user_normal.png', 'images/user_pressed.png', 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      icon: _currentIndex == index
          ? Image.asset(
              pressedIcon,
              width: 32,
              height: 28,
            )
          : Image.asset(
              normalIcon,
              width: 32,
              height: 28,
            ),
      title: Text(title,
          style: TextStyle(
              color: _currentIndex == index
                  ? Color(0xFF1296db)
                  : Color(0xFF8a8a8a))),
    );
  }

  List<Widget> _getAppBarWidgets() {
    return [
      GestureDetector(
        onTap: () {
          //跳转到搜索页面
          RouteManager.router.navigateTo(context, '/search');
        },
        child: Icon(Icons.search),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: GestureDetector(
          onTap: () {
            //弹出菜单
            showMenu(
                context: context,
                position: RelativeRect.fromLTRB(500, 76, 10, 0),
                items: <PopupMenuEntry>[
                  _getMenuItem('发起聊天', imagePath: 'images/icon_chat.png'),
                  _getMenuItem('添加好友', imagePath: 'images/icon_adduser.png'),
                  _getMenuItem('联系客服', imagePath: 'images/icon_service.png'),
                ]);
          },
          child: Icon(Icons.add),
        ),
      )
    ];
  }

  PopupMenuItem _getMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(imagePath, width: 32, height: 32)
              : SizedBox(
                  height: 32,
                  width: 32,
                  child: Icon(icon, color: Colors.white),
                ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
