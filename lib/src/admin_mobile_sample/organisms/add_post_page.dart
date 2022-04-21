import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../export.dart';


class AddPostPage extends ConsumerWidget{
  String _name = '';
  String _postContent = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List PostTextsList = ref.watch(PostTextListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿内容'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: '名前を入力',
                  hintText: '名前',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
              onChanged: (String value) {
                _name = value;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '投稿内容を登録',
                  hintText: '投稿内容',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
              onChanged: (String value) {
                _postContent = value;
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //ここでaddPostの処理？
                  Navigator.of(context).pop();
                },
                child: Text('投稿', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}