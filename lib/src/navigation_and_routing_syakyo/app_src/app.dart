import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'routing.dart';
import 'screens/navigator.dart';

class Bookstore extends StatefulWidget {
  const Bookstore({Key? key}) : super(key: key);
  @override
  _BookstoreState createState() => _BookstoreState();
}

class _BookstoreState extends State<Bookstore> {
  final _auth = BookstoreAuth();
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final RouteState _routeState;
  late final SimpleRouterDelegate _routerDelegate;
  late final TemplateRouteParser _routeParser;

  @override
  void initState() {
    _routeParser = TemplateRouteParser(
      allowedPaths: [
        '/signin',
        '/authors',
        '/settings',
        'books/new',
        '/books/all',
        '/books/popular',
        '/book/bookId',
        '/author/:authorId',
      ],
      guard: _guard,
      initialRoute: '/signin'
    );
    _routeState = RouteState(_routeParser);

    _routerDelegate = SimpleRouterDelegate(
      routeState: _routeState,
      navigatorKey: _navigatorKey,
      builder: (context) => BookstoreNavigator(
        navigatorKey: _navigatorKey,
      ),
    );

    _auth.addListener(_handleAuthStateChanged);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => RouteStateScope(
    notifier: _routeState,
    child: BookstoreAuthScope(
      notifier: _auth,
      child: MaterialApp.router( //routerの設定
        routerDelegate: _routerDelegate, //必須の引数routerDelegate
        routeInformationParser: _routeParser, //必須の引数routeInformationParser
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            }
          )
        ),
      ),
    ),
  );

  Future<ParsedRoute> _guard(ParsedRoute from) async {
    final signedIn = _auth.signedIn;
    final signInRoute = ParsedRoute('/signin', '/signin', {}, {});

    if (!signedIn && from != signInRoute) {
      return signInRoute;
    }
    else if (signedIn && from == signInRoute) {
      return ParsedRoute('/books/popular', '/books/popular', {}, {});
    }
    return from;
  }

  void _handleAuthStateChanged() {
    if (!_auth.signedIn) {
      _routeState.go('/signin');
    }
  }

  @override
  void dispose() {
    _auth.removeListener(_handleAuthStateChanged);
    _routeState.dispose();
    _routerDelegate.dispose();
    super.dispose();
  }
}

