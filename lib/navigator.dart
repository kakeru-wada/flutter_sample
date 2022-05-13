
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'src/routing_exp.dart';
import 'scaffold_main.dart';
import 'src/export.dart';

class mainNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const mainNavigator({
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  _mainNavigatorState createState() => _mainNavigatorState();
}

class _mainNavigatorState extends State<mainNavigator> {

  @override
  Widget build(BuildContext context) {
    final routeState = context.watch<MainRouteState>();
    final pathTemplate = routeState.route.pathTemplate;

    return Scaffold(
      appBar: AppBar(

      ),
      drawer: SafeArea(
        child: Drawer(
          child:
              ListView.builder(
                itemCount: appList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(appNameList[index]),
                    onTap: () => {
                      routeState.go('/' + appNameList[index]),
                      Navigator.pop(context)
                    },
                  );
                },
              )
        ),
      ),
      body: Navigator(
        key: widget.navigatorKey,
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
        pages: [
          if (pathTemplate.startsWith('/appMain'))
            MaterialPage(
              key: ValueKey('appMain'),
              child: appCardList()
            )
          else if (pathTemplate.startsWith('/navigation_and_routing'))
            MaterialPage(
              key: ValueKey('navigation_and_routing'),
              child: Bookstore()
            )
          else if (pathTemplate.startsWith('/admin_mobile_sample'))
            MaterialPage(
              key: ValueKey('admin_mobile_sample'),
              child: AdminMobileSampleApp()
            )
          else if (pathTemplate.startsWith('/first_sample'))
            MaterialPage(
              key: ValueKey('first_sample'),
              child: FirstSampleApp()
            )
          else if (pathTemplate.startsWith('/sudoku_app'))
            MaterialPage(
              key: ValueKey('sudoku_app'),
              child: SudokuApp()
            )
        ],
      ),
    );
  }
}