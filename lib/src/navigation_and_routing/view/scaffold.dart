import '../view.dart';
import '../controller/route_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookStoreScaffold extends StatelessWidget {
  var currentTab =[
    BooksPage(),
    AuthorPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var BottomNavProvider = context.watch<BottomNavBarState>();

    return Scaffold(
      body:
        currentTab[BottomNavProvider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: BottomNavProvider.currentIndex,
          onTap: (index){
            BottomNavProvider.currentIndex = index;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Books',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:  'Person',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label:  'Settings',
            ),
          ],
        ),
      );
  }
}