import 'package:flutter/material.dart';
import '../global_services/user_login_service.dart';
import '../repository/global_service_repository.dart';

class UserLoginStore with ChangeNotifier {
  Future<void> login(String account, String password) async {
    debugPrint('UserLogined');
    List<UserLoginService> loginServices =
        GlobalServiceRepository.getService<List<UserLoginService>>();
    loginServices.forEach((loginService) {
      loginService.loginHandler(account);
    });
  }

  Future<void> logout(String account) async {
    debugPrint('UserLogined');
    List<UserLoginService> loginServices =
        GlobalServiceRepository.getService<List<UserLoginService>>();
    loginServices.forEach((loginService) {
      loginService.logoutHandler(account);
    });
  }
}
