import 'package:flutter/material.dart';
import 'test_page3.dart';

class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test2"),
        ),
        body: Center(
            child: Container(
                color: Colors.greenAccent,
                child: Text("Test2", style: TextStyle(fontSize: 80))
            )
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: 'back',
              onPressed: () => {
                Navigator.of(context).pop()
              },
              child: Text('戻る'),
            ),
            FloatingActionButton(
              heroTag: 'forward',
              onPressed: () => {
                Navigator.of(context).pushNamed('/test3')
              },
              child: Text('進'),
            ),
          ],
        )
    );
  }
}