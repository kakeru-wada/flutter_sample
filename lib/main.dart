import 'package:flutter/material.dart';
import 'package:untitled/src/sample_counter_app/main.dart';
import 'src/export.dart';

void main() {
  runApp(appListPage());
}

List appList = [
  FirstSampleApp(),
  ListViewApp(),
  SampleTodoApp(),
  CounterApp(),
  LogInUI(),
  AdminMobileSampleApp()
];
List<String> appNameList = [
  'first_sample',
  'sample_list_view',
  'sample_todo_app',
  'sample_counter',
  'sign_in_sample',
  'admin_mobile_sample'
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
      appBar: appBar(
        title: 'メインメニュー',
      ),
      drawer: appNavBar(),
      body: ListView.builder(
        itemCount: appList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return appList[index];
                    })
                  );
                },
                child: Text(
                  appNameList[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class appNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text('app list')),
            ListView.builder(
              itemCount: appList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(appNameList[index]),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return appList[index];
                        })
                    );
                  },
                );
              },
            )
          ],
        ),
    );
  }
}
class appBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  appBar({this.title = ''});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          centerTitle: true,
          title: Text(title),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        preferredSize: Size.fromHeight(100.0)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}