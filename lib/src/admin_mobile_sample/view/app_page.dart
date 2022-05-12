import '../export.dart';
import '../model/post_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SideNavigation(),
            VerticalDivider(thickness: 1, width: 1,),
            Expanded(child: PostList())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PostModel postModel = context.read<PostModel>();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return ChangeNotifierProvider<PostModel>.value(
                value: postModel,
                child: AddPostPage(),
              );
            })
          );
            },
        child: Icon(Icons.add)
      ),
    );
  }
}