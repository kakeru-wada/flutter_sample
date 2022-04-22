import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// @immutable
// class PostContent {
//   const PostContent({
//     Key? key,
//     required this.post,
//     // required this.message,
//     // required this.id,
//   });
//
//   final Widget post;
//   // final String id;
//   //上記内容は内容を変更できない（不変）なので、コピー(copywith)してコピーを作る
//   PostContent copyWith({Widget? post, String? id}) {
//     return PostContent(
//       post: post ?? this.post,
//       // id: id ?? this.id
//     );
//   }
// }

class PostContentsNotifier extends StateNotifier<List> {
  PostContentsNotifier(): super([]);//Postリストを初期化するコンストラクタ

  void addPost(post) {
    state = [...state, post];
    //追加する際、変更を加えるのではなく新しくリストを作っている
  }

  // void removePost(String postId) {
  //   state = [
  //     for (final post in state)
  //       if (post.id != postId) post,//既存リストの変更ではなく新しいリストの作成
  //   ];
  // }
}

//TodosNotifier のインスタンスを値に持つ StateNotifierProvider を作成
final postProvider = StateNotifierProvider<PostContentsNotifier, List>((ref) {
  return PostContentsNotifier();
});