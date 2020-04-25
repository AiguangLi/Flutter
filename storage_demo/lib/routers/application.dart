import 'package:fluro/fluro.dart';
import 'routers.dart';

class Application {
  static Router router;

  static initRouters() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
}
