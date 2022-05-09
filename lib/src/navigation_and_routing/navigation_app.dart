import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view.dart';
import 'controller/route_state.dart';

class BookStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomNavBarState>(
        create: (context) => BottomNavBarState(),
      ),
      ChangeNotifierProvider<TabIndexState>(
        create: (context) => TabIndexState(),
      )
    ],
    child: MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      title: 'navigation app',
      routes: <String, WidgetBuilder>{
        '/' : (BuildContext context) => SignInScreen(),
        '/books' : (BuildContext context) => BookStoreScaffold(),
        // '/book_details' : (BuildContext context) => BookDetails(),
        // '/authors' : (BuildContext context) => Authors(),
        // '/author_details' : (BuildContext context) => AuthorDetails(),
        // '/setting' : (BuildContext context) => Setting()
      },
    ),
  );
  }
}