import 'package:flutter/material.dart';
import 'view/test_page1.dart';
import 'view/test_page2.dart';
import 'view/test_page3.dart';

class PageViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageViewPage(title: 'Flutter Demo Home Page'),
      routes: {
        '/test1': (BuildContext context) => TestPage1(),
        '/test2': (BuildContext context) => TestPage2(),
        '/test3': (BuildContext context) => TestPage3(),
      },
    );
  }
}

class PageViewPage extends StatefulWidget {
  PageViewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  // ボトムメニューの遷移先画面
  var _pages = [
    TestPage1(),
    TestPage2(),
    TestPage3(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return LoginPage();

    return Scaffold(
        body: Center(
          child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _pages),
        ),
    );
  }
}