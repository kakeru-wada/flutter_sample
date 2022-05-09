import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/admin_mobile_sample/model/post_model.dart';
import 'export.dart';
import '../../main.dart';

//共通部分
class AdminMobileSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: ChangeNotifierProvider<PostModel>(
        create: (context) => PostModel(),
        child: AdminMobilePageState(),
      ),
    );
  }
}

class AdminMobilePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: '',
      ),
      // drawer: appNavBar(),
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