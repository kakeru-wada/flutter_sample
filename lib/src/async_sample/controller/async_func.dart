import 'dart:async';
import 'dart:io';

class Async {
  void asynctest() {
    print("method begin");
    print(DateTime.now().toString());
    print('data1 start');
    print(asyncFunc('data1', 3));
    print('data2 start');
    print(asyncFunc('data2', 2));
  }

  Future<String> asyncFunc(String name, int time) async {
    return
      Future.delayed(Duration(seconds: time),
      () {return name + ':' + DateTime.now().toString();});
  }
}