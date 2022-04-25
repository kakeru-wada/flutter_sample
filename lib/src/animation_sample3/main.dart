import 'package:flutter/material.dart';
import 'dart:math';

class AnimationSample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationSample3Page(title: 'Flutter Demo Home Page'),
    );
  }
}

class AnimationSample3Page extends StatefulWidget {
  AnimationSample3Page({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _AnimationSample3PageState createState() => _AnimationSample3PageState();
}

class _AnimationSample3PageState extends State<AnimationSample3Page> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  _play() async {
    setState(() {
      _animationController.forward();
    });
  }

  _loop() async {
    setState(() {
      _animationController.repeat();
    });
  }

  _stop() async{
    setState(() {
      _animationController.stop();
    });
  }

  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = _animationController.drive(Tween(begin: 0.0, end: 2.0 * pi));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Transform.rotate(
              angle: _animation.value,
              child: Icon(Icons.cached, size: 100),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _play,
            child: Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: _stop,
            child: Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: _reverse,
            child: Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: _loop,
            child: Icon(Icons.cached_sharp),
          )
        ],
      ),
    );
  }
}







































