import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';

final counterProvider = StateProvider((ref) => 0);

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'counter with riverpod',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: ProviderScope(child: SamplePage(),),
    );
  }
}

class SamplePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: appBar(
        title: 'カウンターアプリ',
      ),
      drawer: appNavBar(),
      body: Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
    ));
  }}