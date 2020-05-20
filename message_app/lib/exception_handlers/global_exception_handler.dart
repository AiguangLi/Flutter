import 'package:catcher/catcher_plugin.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/repository/global_service_repository.dart';
import 'package:message_app/utils/restful_http_response.dart';
import 'package:plugins/plugins.dart';

import 'package:plugins/logger/abstract_logger.dart';

class GlobalExceptionHandler extends ReportHandler {
  @override
  List<PlatformType> getSupportedPlatforms() {
    return [PlatformType.Web, PlatformType.Android, PlatformType.iOS];
  }

  @override
  Future<bool> handle(Report error) async {
    debugPrint('------------GlobalExceptionHandle----------------');
    debugPrint(error.error?.toString());
    debugPrint(error.stackTrace.toString());

    if (null != error.error) {
      switch (error.error.runtimeType) {
        case RestfulError:
          _handleRestfulError(error.error as RestfulError);
          break;
        default:
          break;
      }
    }

    return true;
  }

  void _handleRestfulError(RestfulError error) async {
    debugPrint('------------Restful Error----------------');
    debugPrint('http status code: ${error.httpCode}');
    debugPrint('code: ${error.code}');
    debugPrint('message: ${error.message}');
    await GlobalServiceRepository.getService<Logger>().debug('\nerror code: ${error.code}');
    await GlobalServiceRepository.getService<Logger>().debug('\nerror message: ${error.message}');
    if (error.httpCode == 401) {
      var navigationKey = Catcher.navigatorKey;
      //仅为演示，实际要跳转到登录页面
      _navigateToPageWidget(navigationKey.currentState.overlay.context);
      //RouteManager.router.navigateTo(navigationKey.currentContext ,'/notFound');
    }
  }

  void _navigateToPageWidget(BuildContext context) async {
    await Future.delayed(Duration.zero);
    RouteManager.router.navigateTo(context, '/notFound', transition: TransitionType.inFromBottom);
  }
}
