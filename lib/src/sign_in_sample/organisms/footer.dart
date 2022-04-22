import 'package:flutter/material.dart';
import '../util/color.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have Account?',
          style:  Theme.of(context).textTheme.bodyText2!.copyWith(color: kTextColorSecondary),
        ),
        const SizedBox(width: 4,),
        Text(
          'Sign up',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: kTextColorPrimary),
        )
      ],
    );
  }
}

