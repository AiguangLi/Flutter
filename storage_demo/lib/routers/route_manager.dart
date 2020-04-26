import 'package:fluro/fluro.dart';
import 'routers.dart';

class RouteManager {
  static Router router;

  static initRouters() {
    final router = Router();
    Routes.configureRoutes(router);
    RouteManager.router = router;
  }
}
