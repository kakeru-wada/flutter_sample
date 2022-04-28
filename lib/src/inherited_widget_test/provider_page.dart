import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifier_app.dart';

// class ProviderTestPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Inherited Widget Demo',
//       theme: ThemeData(
//           primarySwatch: Colors.blue
//       ),
//       home: ProviderTestPageWidget(),
//     );
//   }
// }

class ProviderTestPageWidget extends StatefulWidget {
  @override
  _ProviderTestPageState createState() => _ProviderTestPageState();
}

class _ProviderTestPageState extends State<ProviderTestPageWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final Widget _widget = Center(
    child: Consumer<int>(
      builder: (context,value, _) => Text(
        value.toString(),
        style: TextStyle(fontSize: 100),
      ),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider demo'),
      ),
      body: Provider<int>.value(
        value: _counter,
        child: _widget,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return NotifierPage();
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



// class MyInherited extends InheritedWidget {
//   final int count;
//
//   MyInherited({
//     required this.count,
//     required Widget child,
//   }) : super(child: child);
//
//   static MyInherited of(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<MyInherited>() as MyInherited;
//
//   @override
//   bool updateShouldNotify(MyInherited oldWidget) =>
//       oldWidget.count != count;
// }
//
//
// class WidgetA extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     MyInherited _myInheritedWidget = MyInherited.of(context);
//     int count = _myInheritedWidget.count;
//
//     return Text(count.toString());
//   }
// }