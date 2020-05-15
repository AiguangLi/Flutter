import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WordPreview extends StatefulWidget {
  @override
  _WordPreviewState createState() => _WordPreviewState();
}

class _WordPreviewState extends State<WordPreview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          onPressed: () async {
            await _launchInWebViewWithJavaScript('http://upload.huifuwu.cn/test.docx');
          },
          child: Text('打开文件')),
    );
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
