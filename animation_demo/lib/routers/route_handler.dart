import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/route_demo.dart';
import '../pages/font_animation.dart';


Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RouteDemo();
});


Handler fontAnimationHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FontAnimation();
});