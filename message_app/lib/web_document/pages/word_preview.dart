import 'package:flutter/material.dart';
import 'package:message_app/utils/http_util.dart';
class WordPreview extends StatefulWidget {
  @override
  _WordPreviewState createState() => _WordPreviewState();
}

class _WordPreviewState extends State<WordPreview> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          //async的方式才会弹出异常捕获提醒
          onPressed: () async {
            //await _launchInWebViewWithJavaScript('http://mobile.huiguanjia.cn/');
            await HttpUtil.get('index/getUnauth');
            //throw Exception('Test Exception');
          },
          child: Text('发送401未登录请求')),
    );
  }
}
