import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../export.dart';
import '../../model/post_model.dart';

class Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String deleteText;

  const Post({
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

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}
class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {

      Widget _emptyView() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("投稿はありません"),
              SizedBox(height: 16),
              Text(
                '+ボタンから追加してください',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      }

      if (context.watch<PostModel>().contentsList.isEmpty) {
        return _emptyView();
      }
      return
      Container(
        padding: EdgeInsets.only(top: 48),
        child: Column(
            mainAxisSize:  MainAxisSize.max,
            children: [
              PostsHeader(),
              Expanded(
                  child: ListView.builder(
                    itemCount: context.watch<PostModel>().contentsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Post(
                          name: context.watch<PostModel>().contentsList[index].name,
                          message: context.watch<PostModel>().contentsList[index].message
                      );
                    },
                  )
              )
            ]
        ),
    );
  }
}