import 'package:flutter/material.dart';
class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test3"),
        ),
        body: Center(
            child: Container(
                color: Colors.greenAccent,
                child: Text("Test3", style: TextStyle(fontSize: 80))
            )
        ),
        floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => {
              Navigator.of(context).pop()
            },
            child: Text('戻る'),
          )
        ],
      )
    );
  }
}