import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:message_app/home/app.dart';
import '../loading.dart';
import '../search.dart';
import '../message/pages/message_detail.dart';
import '../home/pages/login.dart';

Handler appHomeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppHomeWrapPage();
});

Handler loadingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoadingPage();
});

Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchPage();
});

Handler messageDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String messageId = params['id']?.first;
  return MessageDetailPage(messageId: messageId);
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});
