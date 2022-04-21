import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../export.dart';

class PostList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List PostTextsList = ref.watch(PostTextListProvider);
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
          mainAxisSize:  MainAxisSize.max,
          children: [
            PostsHeader(),
            Expanded(
                child: ListView.builder(
                  itemCount: PostTextsList.length,
                  itemBuilder: (context, index) {
                    return PostTextsList[index];
                  },
                )
            )
          ]
      ),
    );
  }
}