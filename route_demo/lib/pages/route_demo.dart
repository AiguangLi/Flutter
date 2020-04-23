import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:route_demo/components/app_bar_factory.dart';
import 'package:route_demo/pages/product_list.dart';
import '../routers/application.dart';

class RouteDemo extends StatefulWidget {
  RouteDemo({Key key}) : super(key: key);

  @override
  _RouteDemoState createState() => _RouteDemoState();
}

class _RouteDemoState extends State<RouteDemo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> routeTypes = [
    'Navigator',
    'Native',
    'FadeIn',
    'Cupertino',
    'InFromBottom',
    'InFromLeft',
    'InFromRight',
    'MaterialFullScreen',
    'CupertinoFullScreen',
    'NativeModal',
    'Custom',
    'NotFound',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarFactory.buildCenterAppBar('Route Demo'),
      body: ListView.builder(
          itemCount: routeTypes.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(routeTypes[index]),
              onTap: () {
                handleRouteType(context, routeTypes[index]);
              },
            );
          }),
    );
  }

  void handleRouteType(BuildContext context, String routerType) {
    switch (routerType) {
      case 'Navigator':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductList()));
        break;
      case 'Native':
        Application.router.navigateTo(context, '/productDetail?id=10&name=Native',
            transition: TransitionType.native);
        break;
      case 'Cupertino':
        Application.router.navigateTo(context, '/productDetail?id=10&name=Cupertino',
            transition: TransitionType.cupertino);
        break;
      case 'FadeIn':
        ///路由参数传过去的是一个数组，如果存在同名的不同参数，可以解析出数组
        Application.router.navigateTo(context, '/productDetail?id=10&name=FadeIn&name=FadeIn2',
            transition: TransitionType.fadeIn,
            transitionDuration: Duration(milliseconds: 300));
        break;
      case 'InFromBottom':
        Application.router
            .navigateTo(context, '/productDetail?id=9&name=InFromBottom',
                transition: TransitionType.inFromBottom,
                transitionDuration: Duration(milliseconds: 500))
            .then((result) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Back From ProductDetailPage With $result'),
            duration: Duration(seconds: 1),
          ));
        });
        break;
      case 'InFromLeft':
        Application.router.navigateTo(context, '/productDetail?id=10&name=InFromLeft',
            transition: TransitionType.inFromLeft,
            transitionDuration: Duration(milliseconds: 500));
        break;
      case 'InFromRight':
        Application.router.navigateTo(context, '/productDetail?id=11&name=InFromRight',
            transition: TransitionType.inFromRight,
            transitionDuration: Duration(milliseconds: 500));
        break;
      case 'MaterialFullScreen':
        Application.router.navigateTo(context, '/productDetail?id=11&name=MaterialFullScreen',
            transition: TransitionType.materialFullScreenDialog,
            transitionDuration: Duration(milliseconds: 500));
        break;
      case 'CupertinoFullScreen':
        Application.router.navigateTo(context, '/productDetail?id=11&name=CupertinoFullScreen',
            transition: TransitionType.cupertinoFullScreenDialog,
            transitionDuration: Duration(milliseconds: 500));
        break;
      case 'NativeModal':
        Application.router.navigateTo(context, '/productDetail?id=11&name=NativeModal',
            transition: TransitionType.nativeModal,
            transitionDuration: Duration(milliseconds: 500));
        break;
      case 'Custom':
        var transition = (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return ScaleTransition(
            scale: animation,
            child: RotationTransition(
              turns: animation,
              child: child,
            ),
          );
        };
        Application.router.navigateTo(context, '/productDetail?id=11&name=Custom',
            transition: TransitionType.custom,
            transitionBuilder: transition,
            transitionDuration: Duration(milliseconds: 500));
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
