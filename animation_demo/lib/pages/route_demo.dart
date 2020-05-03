import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';
import 'package:plugins/routers/route_manager.dart';

class RouteDemo extends StatefulWidget {
  RouteDemo({Key key}) : super(key: key);

  @override
  _RouteDemoState createState() => _RouteDemoState();
}

class _RouteDemoState extends State<RouteDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> routeList = [
    'FontAnimation',
    'CurveAnimation',
    'MaskAnimation',
    'NumberAnimation',
    'AnimationContainer',
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
      case 'FontAnimation':
        RouteManager.router.navigateTo(context, '/fontAnimation',
            transition: TransitionType.inFromBottom);
        break;
      case 'CurveAnimation':
        RouteManager.router.navigateTo(context, '/curveAnimation',
            transition: TransitionType.inFromBottom);
        break;
      case 'MaskAnimation':
        RouteManager.router.navigateTo(context, '/maskAnimation',
            transition: TransitionType.inFromBottom);
        break;
      case 'NumberAnimation':
        RouteManager.router.navigateTo(context, '/numberAnimation',
            transition: TransitionType.inFromBottom);
        break;
      case 'AnimationContainer':
        RouteManager.router.navigateTo(context, '/animationContainer',
            transition: TransitionType.inFromBottom);
        break;
      case 'NotFound':
        RouteManager.router.navigateTo(context, '/errorRoute?id=none',
            transition: TransitionType.nativeModal);
        break;
      default:
        break;
    }
  }
}
