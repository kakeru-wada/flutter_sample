import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/post_model.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage>{
  var _nameController = TextEditingController();
  var _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: _nameController,
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
                  controller: _messageController,
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PostModel>().createList(_nameController.text, _messageController.text);
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