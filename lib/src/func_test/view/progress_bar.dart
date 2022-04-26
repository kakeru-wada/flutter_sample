import 'package:flutter/material.dart';
import 'loading_page.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Stack(
        children: [
          SizedBox(
            child: LinearProgressIndicator(
              minHeight: 30,
              backgroundColor: Colors.white,
              value: 0.7,
            ),
          ),
          Align(
            child: Text(
              'test progress bar',
              style: TextStyle(
                  fontSize: 20, color: Colors.black45
              ),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
      onPressed: () => {
        // Navigator.of(context).pushNamed('/load')
        // setState(() {
        //   dataViewList = loadingPage.getNowLoading(context);
        // })


      },
    );
  }
}