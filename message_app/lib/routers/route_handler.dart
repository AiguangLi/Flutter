import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../loading.dart';
import '../app.dart';
import '../search.dart';


Handler appHomeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppHomePage();
});

Handler loadingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoadingPage();
});

Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchPage();
});
