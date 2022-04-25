import 'package:flutter/material.dart';
import '../../main.dart';
import 'view/icon_list.dart';

class FuncTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'func test',
      theme: ThemeData.light(),
      home: FuncTestPage(),
    );
  }
}

class FuncTestPage extends StatefulWidget {
  @override
  _FuncTestPageState createState() => _FuncTestPageState();
}

class _FuncTestPageState extends State<FuncTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Func Test',
        elevation: 0,
      ),
      body: Column(
        children: [
          //ここに追加
        ],
      ),
    );
  }
}