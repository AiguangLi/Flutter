import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catcher/catcher_plugin.dart';
import 'package:message_app/exception_handlers/global_exception_handler.dart';

//import 'error_exception/service/error_service.dart';
import 'repository/global_service_repository.dart';
import 'package:plugins/routers/route_manager.dart';
import 'routers/routers.dart';

void main() {
  GlobalServiceRepository.resisterServices();
  //GlobalServiceRepository.resisterErrorService();

  CatcherOptions debugOptions = CatcherOptions(PageReportMode(), [
    ConsoleHandler(enableDeviceParameters: true), GlobalExceptionHandler()
  ]);

  /// Release configuration. Same as above, but once user accepts dialog, user will be propmpted to send email with crash to support.
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    ToastHandler()
  ]);

  var navigationKey = GlobalKey<NavigatorState>();

  // CatcherOptions profileOptions = CatcherOptions(
  //   PageReportMode(), [ConsoleHandler(), ToastHandler()],
  //   handlerTimeout: 10000,);

  Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions, navigatorKey: navigationKey);
}

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //将style设置到app
    SystemChrome.setSystemUIOverlayStyle(_style);
    RouteManager.initRouters(Routes.getSharedInstance());
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      title: 'Message App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xFF1296db),
        scaffoldBackgroundColor: Color(0xFFF1F1F1),
        cardColor: Color(0xEE1296db),
      ),
      onGenerateRoute: RouteManager.router.generator,
    );
  }
}
