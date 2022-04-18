import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

//サイドナビ部分
class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex =index;
        });
      },
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.thumbs_up_down),
          label: Text('ThumbsUpDown'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('People'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.face),
          label: Text('Face'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark),
          label: Text('Bookmark'),
        ),
      ]);
  }
}

//post部分

//postのheader部分の作成
class _PostsHeader extends StatelessWidget {
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

class _Post extends ConsumerWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String deleteText;

  const _Post({
    Key? key,
    this.name = 'default_name',
    this.message = 'default_message' ,
    this.textReason = 'default_textReason' ,
    this.colorPrimary = Colors.blueAccent,
    this.colorPositive = Colors.blueAccent,
    this.textPositive = 'default_text',
    this.colorNegative = Colors.amberAccent,
    this.deleteText = 'default_deleteText',
}) : super(key:  key);

  //投稿cardを表示するwidget
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      name.substring(0,1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(name),
              subtitle: Text('〇分前'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPrimary, width: 2),
                      )
                    ),
                    child: Text(
                      textReason,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 24),
                  //↓でonpressedで削除機能の実装
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: colorNegative,
                        ),
                        onPressed: () {
                        },
                        child: Text(deleteText),
                      )),
                  SizedBox(width: 8),
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary:  colorPositive,
                          backgroundColor: colorPositive.withOpacity(0.2)
                        ),
                        onPressed: () {},
                        child: Text(textPositive),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _PostContent extends ConsumerWidget{
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     String _name = ref.watch(nameProvider);
//     String _message = ref.watch(messageProvider);
//     Widget onePost = _Post(name: _name, message: _message,);
//     return _Post();
//   }
// }
// class _PostGreen extends StatelessWidget{}

class PostList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List PostTextsList = ref.watch(PostTextListProvider);
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize:  MainAxisSize.max,
        children: [
          _PostsHeader(),
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
                  Widget aPost = _Post(name: _name, message: _postContent);
                  PostTextsList.add(aPost);
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