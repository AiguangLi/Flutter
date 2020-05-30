import 'package:flutter/cupertino.dart';

class AppHomeStore with ChangeNotifier {

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  changeIndex(int newIndex) {
    if (_pageIndex != newIndex) {
      _pageIndex = newIndex;

      notifyListeners();
    }
  }
}
