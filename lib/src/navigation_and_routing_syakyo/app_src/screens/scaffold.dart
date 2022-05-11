import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/main.dart';
import '../routing.dart';
import 'scaffold_body.dart';

class BookstoreScaffold extends StatelessWidget {
  const BookstoreScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeState = context.watch<RouteState>();
    final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);
    final String appbarTitle = _getAppBarTitle(routeState.route.pathTemplate);


    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Books'),
                selected: selectedIndex == 0,
                onTap: () => {
                  routeState.go('/books/popular'),
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Authors'),
                selected: selectedIndex == 1,
                onTap: () => {
                  routeState.go('/authors'),
                  Navigator.pop(context)
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                selected: selectedIndex == 2,
                onTap: () => {
                  routeState.go('/settings'),
                  Navigator.pop(context)
                },
              ),
            ],
          ),
        ),
      ),
      body: const BookstoreScaffoldBody(),
      // body: AdaptiveNavigationScaffold(
      //   selectedIndex: selectedIndex,
      //   body: const BookstoreScaffoldBody(),
      //   onDestinationSelected: (idx) {
      //     if (idx == 0) routeState.go('/books/popular');
      //     if (idx == 1) routeState.go('/authors');
      //     if (idx == 2) routeState.go('/settings');
      //   },
      //   destinations: const [
      //     AdaptiveScaffoldDestination(
      //       title: 'Books',
      //       icon: Icons.book,
      //     ),
      //     AdaptiveScaffoldDestination(
      //       title: 'Authors',
      //       icon: Icons.person,
      //     ),
      //     AdaptiveScaffoldDestination(
      //       title: 'Settings',
      //       icon: Icons.settings,
      //     ),
      //   ],
      // ),
    );
  }

  int _getSelectedIndex(String pathTemplate) {
    if (pathTemplate.startsWith('/books')) return 0;
    if (pathTemplate == '/authors') return 1;
    if (pathTemplate == '/settings') return 2;
    return 0;
  }

  String _getAppBarTitle(String pathTemplate) {
    if (pathTemplate.startsWith('/books')) return 'Books';
    if (pathTemplate == '/authors') return 'Authors';
    if (pathTemplate == '/settings') return 'Settings';
    return 'Books';
  }
}
