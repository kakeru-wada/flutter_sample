
import 'package:flutter/cupertino.dart';

import 'parsed_route.dart';

class SampleRouteInformationParser extends RouteInformationParser<ParsedRoute> {

  //アプリの起動、更新、進戻るボタン、URL直接入力によって呼び出されるparseRouteInfomation()をオーバーライド
  @override
  Future<ParsedRoute> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == ParsedRoute.home().uri.pathSegments[0]) {
        return ParsedRoute.home();
      }
    }
    return ParsedRoute.add();
  }

  //アプリ側でParsedRouteの変更がされた際にURLの変更を含めRouteInfomationを構築、OS側へ通知する
  @override
  RouteInformation? restoreRouteInformation(ParsedRoute configuration) {
    if (configuration.isAddSection) {
      return RouteInformation(location: ParsedRoute.add().uri.path);
    }
    if (configuration.isHomeSection) {
      return RouteInformation(location: ParsedRoute.home().uri.path);
    }
    return null;
  }
}