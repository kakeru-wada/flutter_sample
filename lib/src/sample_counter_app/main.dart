import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

// void main () {
//   runApp(
//     ProviderScope(child: CounterApp())
//   );
// }

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'counter with riverpod',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: SamplePage(),
    );
  }
}

class SamplePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('カウンターアプリ（サンプル）')),
      body: Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
    ));
  }}