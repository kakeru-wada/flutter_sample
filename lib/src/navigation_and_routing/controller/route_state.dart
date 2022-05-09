import 'package:flutter/material.dart';

// class RouteState extends ChangeNotifier {
//   var _route;
//
//   RouteState() : _route = '/';
//
//   get route => _route;
//
//   set route(route) {
//     if (_route == route) return;
//
//     _route = route;
//     notifyListeners();
//   }
//   Future<void> go(String route) async {
//     this.route = route;
//   }
// }

class BottomNavBarState extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class TabIndexState extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}