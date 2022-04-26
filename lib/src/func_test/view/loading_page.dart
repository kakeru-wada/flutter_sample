import 'package:flutter/material.dart';

class loadingPage extends StatelessWidget {

  static Widget getNowLoading(context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 10,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test1"),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
