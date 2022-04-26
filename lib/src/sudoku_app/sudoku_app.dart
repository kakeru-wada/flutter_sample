import 'package:flutter/material.dart';
import 'package:untitled/src/sudoku_app/view/sudoku_page.dart';

class SudokuApp extends StatelessWidget {
  const SudokuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SudokuPage(),
    );
  }
}