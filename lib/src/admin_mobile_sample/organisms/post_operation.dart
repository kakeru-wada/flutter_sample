import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Postする内容の要件
//name, message,

//Postモデル、name、messageを持っている
class PostContent {
  const PostContent({
    Key? key,
    required this.name,
    required this.message,
    required this.id,
  });

  final String name;
  final String message;
  final String id;

  //上記内容は内容を変更できない（不変）なので、コピー(copywith)してコピーを作る
  PostContent copyWith({String? id, String? name, String? message}) {
    return PostContent(
      name: name ?? this.name,
      message: message ?? this.message,
      id: id ?? this.id,
    );
  }
}

class PostContentsNotifier extends StateNotifier<List<PostContent>> {
  PostContentsNotifier(): super([]);//Postリストを初期化するコンストラクタ

  void addPost(PostContent post) {
    state = [...state, post];
    //追加する際、変更を加えるのではなく新しくリストを作っている
  }

  void removePost(String postId) {
    state = [
      for (final post in state)
        if (post.id != postId) post,//既存リストの変更ではなく新しいリストの作成
    ];
  }
}

//TodosNotifier のインスタンスを値に持つ StateNotifierProvider を作成
final postProvider = StateNotifierProvider<PostContentsNotifier, List<PostContent>>((ref) {
  return PostContentsNotifier();
});