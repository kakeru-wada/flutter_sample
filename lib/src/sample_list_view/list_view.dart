import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  final List<Map<String, dynamic>> listItems = [
    {
      'text': 'Item 1',
      'color': Colors.blue[600],
    },
    {
      'text': 'Item 2',
      'color': Colors.blue[300],
    },
    {
      'text': 'Item 3',
      'color': Colors.blue[100],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              padding: EdgeInsets.all(4),
              // childrenを指定してリスト表示
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.blue[600],
                    child: Text('Item 1'),
                  ),
                  Container(
                    height: 50,
                    color: Colors.blue[300],
                    child: Text('Item 2'),
                  ),
                  Container(
                    height: 50,
                    color: Colors.blue[100],
                    child: Text('Item 3'),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(4),
              // 配列を元にリスト表示
              child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: listItems[index]['color'],
                    child: Text(listItems[index]['text']),
                  );
                },
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(4),
              // 各アイテムの間にスペースなどを挟みたい場合
              child: ListView.separated(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: listItems[index]['color'],
                    child: Text(listItems[index]['text']),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}