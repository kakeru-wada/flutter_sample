// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountData extends ChangeNotifier {
  int count = 0;

  void increment() {
    count = count + 1;
    notifyListeners();
    //値が変更されたことが通知され、UIが再構築される
  }
}

class ParentWidget extends StatelessWidget {
  final data = CountData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountData>(
      create: (context) => CountData(),
      child: Container(
        child: ChildWidget(),
      )
    );
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountData data = context.watch<CountData>();

    return Scaffold(body: Column(
      children: <Widget>[
        Text('count is ${data.count.toString()}'),
        TextButton(
          child: Text('increment'),
          onPressed: () {
            data.increment();
          },
        )
      ],
    ));
  }
}