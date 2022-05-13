import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/routing_exp.dart';
import 'navigator.dart';

void main() {
  runApp(appMainPage());
}

class appMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app list page',
      theme: ThemeData.light(),
      home: appListPage(),
    );
  }
}

class appListPage extends StatefulWidget {
  const appListPage({Key? key}) : super(key: key);
  @override
  _appListPageState createState() => _appListPageState();
}

class _appListPageState extends State<appListPage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final MainRouteState _routeState;
  late final SimpleRouterDelegate _routerDelegate;
  late final TemplateRouteParser _routeParser;

  @override
  void initState() {
    _routeParser = TemplateRouteParser(
      allowedPaths: [
        '/appMain',
        '/navigation_and_routing',
        '/admin_mobile_sample',
        '/first_sample',
        '/sudoku_app'
      ],
      initialRoute: '/appMain'
    );

    _routeState = MainRouteState(_routeParser);

    _routerDelegate = SimpleRouterDelegate(
      routeState: _routeState,
      navigatorKey: _navigatorKey,
      builder: (context) => mainNavigator(
        navigatorKey: _navigatorKey,
      )//Navigatorを入れる
    );

    super.initState();
  }

  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider<MainRouteState>(
        create: (context) => _routeState,
      )
    ],
    child: MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeParser,
    ),
  );

  void dispose() {
    _routeState.dispose();
    _routerDelegate.dispose();
    super.dispose();
  }
}