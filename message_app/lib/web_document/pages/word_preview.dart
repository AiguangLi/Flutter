import 'package:flutter/material.dart';
import 'package:message_app/utils/http_util.dart';
import 'package:plugins/logger/abstract_logger.dart';
import '../../repository/global_service_repository.dart';

class WordPreview extends StatefulWidget {
  @override
  _WordPreviewState createState() => _WordPreviewState();
}

class _WordPreviewState extends State<WordPreview> {
  String _log = '';
  @override
  Widget build(BuildContext context) {
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
              child: Text('读取日志')),
          Text(_log),
        ],
      ),
    );
  }
}
