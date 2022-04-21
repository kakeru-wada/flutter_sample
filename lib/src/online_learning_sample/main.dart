import 'package:flutter/material.dart';
import '../../main.dart';
import 'export.dart';

const figmaLogoUrl =
    'https://user-images.githubusercontent.com/7200238/83031886-1ce87880-a070-11ea-89c8-5cee840d5782.png';
const sketchLogoUrl =
    'https://user-images.githubusercontent.com/7200238/83145378-a7dc7800-a12f-11ea-93e1-32c7982c5e63.png';
const xdLogoUrl =
    'https://user-images.githubusercontent.com/7200238/83145578-f558e500-a12f-11ea-85fa-3e26a966d180.png';

class LearningSample extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: TopPage(),
    );
  }
}





















