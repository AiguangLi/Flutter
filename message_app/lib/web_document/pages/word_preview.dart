import 'package:flutter/material.dart';
import '../../global_stores/user_login_store.dart';
import 'package:message_app/utils/http_util.dart';
import 'package:plugins/logger/abstract_logger.dart';
import 'package:provider/provider.dart';
import '../../repository/global_service_repository.dart';

class WordPreview extends StatefulWidget {
  @override
  _WordPreviewState createState() => _WordPreviewState();
}

class _WordPreviewState extends State<WordPreview> {
  String _log = '';
  @override
  Widget build(BuildContext context) {
    final userLoginStore = Provider.of<UserLoginStore>(context);
    return Center(
      child: Column(
        children: <Widget>[
          FlatButton(
            //async的方式才会弹出异常捕获提醒
            onPressed: () async {
              await HttpUtil.get('index/getUnauth');
            },
            child: Text('发送401未登录请求'),
          ),
          FlatButton(
            //async的方式才会弹出异常捕获提醒
            onPressed: () async {
              DateTime now = DateTime.now();

              String log = await GlobalServiceRepository.getService<Logger>()
                  .readLog('debug', '${now.year}_${now.month}_${now.day}');
              setState(() {
                _log = log;
              });
            },
            child: Text('读取日志'),
          ),
          FlatButton(
            //async的方式才会弹出异常捕获提醒
            onPressed: () async {
              await userLoginStore.login('admin', 'password');
            },
            child: Text('模拟登录'),
          ),
          FlatButton(
            //async的方式才会弹出异常捕获提醒
            onPressed: () async {
              await userLoginStore.logout('admin');
            },
            child: Text('模拟退出登录'),
          ),
          Text(_log),
        ],
      ),
    );
  }
}
