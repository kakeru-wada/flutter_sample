import 'package:flutter/material.dart';
import 'package:untitled/src/pageview_sample/main.dart';
import 'package:untitled/src/sample_counter_app/main.dart';
import 'src/export.dart';

void main() {
  runApp(appListPage());
}

List appList = [
  appListPage(),
  FirstSampleApp(),
  ListViewApp(),
  SampleTodoApp(),
  CounterApp(),
  LogInUI(),
  AdminMobileSampleApp(),
  BatteryOptimizer(),
  FlightBooking(),
  AnimationSample(),
  AnimationSample2(),
  LearningSample(),
  ParentWidget(),
  TodoListView(),
  PageViewSample(),
  AnimationSample3(),
  FuncTest(),
];
List<String> appNameList = [
  'メインメニュー',
  'first_sample',
  'sample_list_view',
  'sample_todo_app',
  'sample_counter',
  'sign_in_sample',
  'admin_mobile_sample',
  'battery_optimizer_sample',
  'flight_booking_sample',
  'animation_sample',
  'animation_sample2',
  'online_learning_sample',
  'provider_sample',
  'stateNotifier_test',
  'page_view_sample',
  'animation_sample3',
  'func_test',
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
        itemCount: appList.length-1,
        itemBuilder: (context, index) {
          return Card(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return appList[index+1];
                    })
                  );
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

class appNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
              child:
              DrawerHeader(
                  child: Text(
                    'app list',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Theme.of(context).primaryColor),)
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: appList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(appNameList[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
  final int elevation;
  appBar({this.title = '', this.elevation = 4});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          // elevation: elevation,
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