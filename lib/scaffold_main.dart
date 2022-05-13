import 'package:flutter/material.dart';
import 'main.dart';
import 'src/routing_exp.dart';
import 'package:provider/provider.dart';
import 'src/export.dart';


List appList = [
  appMainPage(),
  FirstSampleApp(),
  AdminMobileSampleApp(),
  SudokuApp(),
  Bookstore(),
];
List<String> appNameList = [
  'appMain',
  'first_sample',
  'admin_mobile_sample',
  'sudoku_app',
  'navigation_and_routing'
];

class appCardList extends StatefulWidget {
  const appCardList({Key? key}) : super(key: key);
  @override
  _appCardListState createState() => _appCardListState();
}

class _appCardListState extends State<appCardList> {
  @override
  Widget build(BuildContext context) {
    final routeState = context.watch<MainRouteState>();
    return Scaffold(
      body: ListView.builder(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            itemCount: appList.length-1,
            itemBuilder: (context, index) {
              return Card(
                  child: TextButton(
                    onPressed: () {
                      routeState.go('/' + appNameList[index+1]);
                    },
                    child: Text(
                      appNameList[index+1],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
              );
            },
          ),
    );
  }
}