import 'package:flutter/material.dart';

class PostsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                  color: Colors.grey[300],
                  width: 48,
                  height: 48,
                  child: Icon(
                    Icons.storage,
                    color: Colors.grey[800],
                  )
              ),
            ),
            title: Text('投稿内容'),
            subtitle: Text(''),
          ),
        ),
      ],
    );
  }
}