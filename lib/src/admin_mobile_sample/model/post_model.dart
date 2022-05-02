import 'package:flutter/material.dart';

class PostContents {
  String name;
  String message;
  PostContents({this.name = '', this.message = ''});
}

class PostModel with ChangeNotifier {

  List<PostContents> contentsList = [];

  void createList(name_value, message_value) {
    contentsList = [...contentsList,
      PostContents(name: name_value, message: message_value)
    ];
    notifyListeners();
  }
}