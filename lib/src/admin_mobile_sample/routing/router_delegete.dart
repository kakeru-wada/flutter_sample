import 'package:untitled/src/admin_mobile_sample/view/app_page.dart';

import '../export.dart';
import 'package:flutter/material.dart';
import 'parsed_route.dart';
import 'route_state.dart';

class SampleRouterDelegate extends RouterDelegate<ParsedRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ParsedRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final RouteState _routeState;

  //_routeStateにlistenerを設定
  SampleRouterDelegate(this._routeState) : navigatorKey = GlobalKey<NavigatorState>() {
    _routeState.addListener(notifyListeners);
  }

  @override
  ParsedRoute get currentConfiguration {
    if (_routeState.isLogin) return ParsedRoute.home();
    return ParsedRoute.add();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
         MaterialPage(
          child: AddPostPage(),
        ),
        if (_routeState.isLogin)
          MaterialPage(
            child: AppPage()
          ),
      ],
      onPopPage: (route, result) {
        return false;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(ParsedRoute configuration) async {
    _routeState.isLogin = configuration.isHomeSection;
  }
}