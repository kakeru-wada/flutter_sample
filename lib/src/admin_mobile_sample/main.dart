import 'package:flutter/material.dart';

//共通部分
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: AdminMobilePage(),
    );
  }
}

class AdminMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //ここにウィジェットを並べる
          SideNavigation(),
          VerticalDivider(thickness: 1, width: 1,),
          Expanded(child: PostList())
        ],
      )
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
//_を付けてprivateにし、PostListで呼び出す
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
            title: Text('Posts'),
            subtitle: Text(''),
          ),
        ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;

  const _Post({
    Key? key,
    this.name = 'default_name',
    this.message = 'default_message' ,
    this.textReason = 'default_textReason' ,
    this.colorPrimary = Colors.blueAccent,
    this.colorPositive = Colors.blueAccent,
    this.textPositive = 'default_text',
    this.colorNegative = Colors.amberAccent,
    this.textNegative = 'default_textNegative',
}) : super(key:  key);

  //投稿cardを表示するwidget
  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: colorNegative,
                        ),
                        onPressed: () {},
                        child: Text(textNegative),
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

class _PostContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _Post();
  }
}
// class _PostGreen extends StatelessWidget{}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize:  MainAxisSize.max,
        children: [
          _PostsHeader(),
          Expanded(
            child: ListView(
              children: [
                _PostContent()
              ],
            ),
          )
        ],
      ),


    );
  }
}