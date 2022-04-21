import 'package:flutter/material.dart';
import '../export.dart';

class OptimizeNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: kColorPurple,
            padding: EdgeInsets.symmetric(horizontal: 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )
        ),
        onPressed: () {},
        child: Text('optimize now' , style: TextStyle(color: Colors.white),),
      ),
    );
  }
}