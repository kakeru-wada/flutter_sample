import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'export.dart';
import '../../main.dart';

//削除情報を扱うprovider
final deleteListProvider = StateProvider((ref) => []);
//投稿内容を補完するprovider
final PostTextListProvider = StateProvider((ref) => []);

//共通部分
class AdminMobileSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: ProviderScope(child: AdminMobilePageState()),
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
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return AddPostPage();
            })
          );
            },
        child: Icon(Icons.add)
      ),
    );
  }
}