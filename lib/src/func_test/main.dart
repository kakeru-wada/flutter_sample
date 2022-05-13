import 'package:flutter/material.dart';
import 'package:untitled/src/func_test/view/loading_page.dart';
import '../../main.dart';
import 'view/icon_list.dart';
import 'util/font_awesome_icon.dart';

class FuncTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'func test',
      theme: ThemeData.light(),
      home: FuncTestPage(),
      routes: {
        '/load' : (BuildContext context) => loadingPage()
      },
    );
  }
}

class FuncTestPage extends StatefulWidget {
  @override
  _FuncTestPageState createState() => _FuncTestPageState();
}

class _FuncTestPageState extends State<FuncTestPage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            SwitchListTile(
              title: Text('test'),
              value: flag,
              onChanged: (bool value) {
                setState(() {
                  flag = value;
                });
              },
              secondary: giftIcon,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          //ここに追加
          IconList()
        ],
      ),
    );
  }
}