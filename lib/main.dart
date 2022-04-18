import 'package:flutter/material.dart';
import 'src/export.dart';

void main() {
  runApp(appListPage());
}

List appList = [
  FirstSampleApp(),
  ListViewApp(),
  SampleTodoApp(),
  LogInUI(),
  AdminMobileSampleApp()
];
List<String> appNameList = [
  'FirstSampleApp',
  'ListViewApp',
  'SampleTodoApp',
  'LogInUI',
  'AdminMobileSampleApp'
];

class appListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app list page',
      theme: ThemeData.light(),
      home: appCardList(),
    );
  }
}

class appCardList extends StatefulWidget {
  @override
  _appCardListState createState() => _appCardListState();
}

class _appCardListState extends State<appCardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: appList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Expanded(
              child: TextButton(
                onPressed: () {
                  return runApp(appList[index]);
                },
                child: Text(appNameList[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}