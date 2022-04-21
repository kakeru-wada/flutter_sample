import 'package:flutter/material.dart';
import '../export.dart';
import '../../../main.dart';

class Header extends StatelessWidget {
  final String title;
  final bool BackButtonvisiblity;

  const Header({
    Key? key,
    required this.title,
    required this.BackButtonvisiblity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Visibility(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return appListPage();
                      })
                  );
                },
                child: Icon(Icons.chevron_left),
              ),
              visible: BackButtonvisiblity,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        )

    );
  }
}