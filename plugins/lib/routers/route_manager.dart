import 'package:fluro/fluro.dart';
import 'abstact_routers.dart';

class RouteManager {
  static Router router;

  static initRouters(IRouter iRouter) {
    final router = Router();
    iRouter.configureRoutes(router);
    RouteManager.router = router;
  }
}
