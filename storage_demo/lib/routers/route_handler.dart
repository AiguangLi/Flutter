import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/route_demo.dart';
import '../pages/shared_storage_demo.dart';

Handler sharedStorageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SharedStorageDemo();
});

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RouteDemo();
});
