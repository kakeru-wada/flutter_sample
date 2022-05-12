import 'package:flutter/material.dart';

class RouteState extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;
  
  set isLogin(bool flag) {
    _isLogin = true;
    notifyListeners();
  }
}