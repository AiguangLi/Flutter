import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/product_detail_page.dart';
import '../pages/route_demo.dart';

Handler productDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String productId = params['id']?.first;
  String productName = params['name']?.last;
  return ProductDetailPage(productId: productId, productName: productName);
});

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RouteDemo();
});
