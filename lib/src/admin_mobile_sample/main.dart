import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/admin_mobile_sample/model/post_model.dart';
import 'package:untitled/src/admin_mobile_sample/routing/route_information_parser.dart';
import 'package:untitled/src/admin_mobile_sample/routing/route_state.dart';
import 'package:untitled/src/admin_mobile_sample/routing/router_delegete.dart';
import 'export.dart';
import '../../main.dart';

//共通部分
class AdminMobileSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RouteState()),
          ChangeNotifierProvider(create: (context) => SampleRouterDelegate(context.read<RouteState>())),
          ChangeNotifierProvider(create: (context) => PostModel())
        ],
        child: AdminMobilePageState(),
      )
    );
  }
}

class AdminMobilePageState extends StatelessWidget {
  final SampleRouteInformationParser _sampleRouteInformationParser = SampleRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _sampleRouteInformationParser,
      routerDelegate: context.read<SampleRouterDelegate>(),
    );
  }
}