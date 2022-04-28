import 'package:flutter/material.dart';
import 'provider_page.dart';

class InheritedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: InheritedWidgetPage(),
    );
  }
}

class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final Widget _widget = Center(child: WidgetA());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inherited demo'),
      ),
      body: MyInherited(
        count: _counter,
        child: _widget,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(

            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ProviderTestPageWidget();
                })
              );
            },
            child: Icon(Icons.arrow_forward),
          )
        ],
      ),
    );
  }
}



class MyInherited extends InheritedWidget {
  final int count;

  MyInherited({
    required this.count,
    required Widget child,
}) : super(child: child);

  static MyInherited of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInherited>() as MyInherited;

  @override
  bool updateShouldNotify(MyInherited oldWidget) =>
      oldWidget.count != count;
}


class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyInherited _myInheritedWidget = MyInherited.of(context);
    int count = _myInheritedWidget.count;

    return Text(count.toString(), style: TextStyle(fontSize: 100),);
  }
}