import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../components/app_bar_factory.dart';
import '../routers/application.dart';

class RouteDemo extends StatefulWidget {
  RouteDemo({Key key}) : super(key: key);

  @override
  _RouteDemoState createState() => _RouteDemoState();
}

class _RouteDemoState extends State<RouteDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> routeList = [
    'shareStorage',
    'NotFound',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarFactory.buildCenterAppBar('Route Demo'),
      body: ListView.builder(
          itemCount: routeList.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(routeList[index]),
              onTap: () {
                handleRouteType(context, routeList[index]);
              },
            );
          }),
    );
  }

  void handleRouteType(BuildContext context, String routerType) {
    switch (routerType) {
      case 'shareStorage':
        Application.router.navigateTo(context, '/sharedStorage',
            transition: TransitionType.inFromBottom);
        break;
      case 'NotFound':
        Application.router.navigateTo(context, '/errorRoute?id=none',
            transition: TransitionType.nativeModal);
        break;
      default:
        break;
    }
  }
}
