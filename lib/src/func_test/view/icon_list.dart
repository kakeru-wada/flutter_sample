import 'package:flutter/material.dart';
import '../util/font_awesome_icon.dart';

class IconList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: [
              Contents(icon: giftIcon)
            ],
          ),
        ),
      )
    );
  }
}

class Contents extends StatelessWidget {
  final Widget icon;

  const Contents({
    Key? key,
    required this.icon
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(24),
              child: icon,
            ),
          )
        ],
      ),
    );
  }
}