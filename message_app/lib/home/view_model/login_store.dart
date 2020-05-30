import 'package:flutter/cupertino.dart';

class LoginStore with ChangeNotifier {

  bool _isLogined= false;
  bool get isLogined => _isLogined;

  void login(String username, String password) {
    //ToDo: 调用登录接口
    _isLogined = true;
    
  }
  
  void logout() {
    //ToDo: 清除本地缓存用户信息
    _isLogined = false;
  }
}