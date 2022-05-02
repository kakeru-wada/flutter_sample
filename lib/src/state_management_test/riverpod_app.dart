import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifyData extends StateNotifier<double> {
  NotifyData() : super(0.5);

  //暗黙的にstateフィールドが存在
  void changeState(newState) {
    this.state = newState;
  }
}

final _notifyDataProvider =
    StateNotifierProvider<NotifyData, double>(
        (ref) => NotifyData()
    );

// class RiverpodPage extends StatefulWidget {
//   RiverpodPage({Key? key, this.title}) : super(key: key);
//   final String? title;
//   @override
//   _RiverpodPageState createState() => _RiverpodPageState();
// }
//
// class _RiverpodPageState extends State<RiverpodPage> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Consumer(builder: (context, watch, child) {
//             return Text(
//               '${watch(_notifyDataProvider).toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 100),
//             );
//           }),
//           Consumer(builder: (context, watch, child) {
//             return Slider(
//                 value: watch(_notifyDataProvider),
//                 onChanged: (value) =>
//                     context.read(_notifyDataProvider.notifier).changState(value));
//           }),
//         ],
//       ),
//     );
//   }
// }