import 'package:flutter/material.dart';
import 'controller/async_func.dart';

class AsyncTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AsyncTestPage(title: 'Flutter Demo Home Page'),
    );
  }
}
class AsyncTestPage extends StatefulWidget {
  AsyncTestPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _AsyncTestPageState createState() => _AsyncTestPageState();
}
class _AsyncTestPageState extends State<AsyncTestPage> {
  int _counter = 0;
  void _incrementCounter() {
    Async().asynctest();
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}