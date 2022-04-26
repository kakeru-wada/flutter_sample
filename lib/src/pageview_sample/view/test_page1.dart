import 'package:flutter/material.dart';

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test1"),
        ),
        body: Center(
            child: Container(
                color: Colors.redAccent,
                child: Text("Swipe", style: TextStyle(fontSize: 80))
            )
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => {
                      Navigator.of(context).pushNamed('/test2')
                    },
                    child: Text('進'),
                  ),
                ],
          )
        )
    );
  }
}