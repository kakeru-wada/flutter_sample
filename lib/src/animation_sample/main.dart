import 'package:flutter/material.dart';
import '../../main.dart';

class AnimationSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: '',
      ),
      drawer: appNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            size = 200;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: size,
          height: size,
          color: Colors.blue,
        ),
      ),
    );
  }
}