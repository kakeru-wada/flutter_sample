import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/export.dart';

void main() {
  //runApp(const FirstSampleApp());
  // runApp(ListViewApp());
  // runApp(SampleTodoApp());
  runApp(
     ProviderScope(child: CounterApp())
  );
}