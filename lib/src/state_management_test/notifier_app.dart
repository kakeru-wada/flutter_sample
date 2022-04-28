import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifyData with ChangeNotifier {
  double myvalue = 0.5;

  void setValue(double value) {
    myvalue = value;
    notifyListeners();
  }
}

class NotifierPage extends StatefulWidget {
  _NotifierPageState createState() => _NotifierPageState();
}

class _NotifierPageState extends State<NotifierPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NotifyData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifier Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NotifyData>(
              builder: (context, notify_data, _) =>
              Text(
                notify_data.myvalue.toStringAsFixed(2),
                style: TextStyle(fontSize: 100),
              ),
            ),
            NotifySlider(),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
    );
  }
}

class NotifySlider extends StatefulWidget {
  @override
  createState() => _NotifySliderState();
}

class _NotifySliderState extends State<NotifySlider> {
  @override
  Widget build(BuildContext context) {
    final sliderdata = Provider.of<NotifyData>(context);
    return Slider(value: sliderdata.myvalue, onChanged: (value) => sliderdata.setValue(value));
  }
}






















