import 'package:flutter/material.dart';
import 'package:storage_demo/components/app_bar_factory.dart';
import 'package:storage_demo/database/user_dao.dart';
import 'package:storage_demo/models/user.dart';

class DBUserList extends StatefulWidget {
  DBUserList({Key key}) : super(key: key);

  @override
  _DBUserListState createState() => _DBUserListState();
}

class _DBUserListState extends State<DBUserList> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    loadUserFromDB();
  }

  void loadUserFromDB() async {
     users = await UserDao.sharedInstance().listAllUsers();
     setState(() {
       
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBarFactory.buildCenterAppBar('数据库用户列表'),
       body: ListView.builder(
         itemCount: users.length,
         itemBuilder: (context, index) {
         return ListTile(
           title: Text(users[index].nickname),
           leading: Text('${users[index].id}'),
           subtitle: Text(users[index].mobile),
         );
       }),
    );
  }
}