import 'package:flutter/material.dart';
import '../../main.dart';

class SampleTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget{
  @override
  _TodoListPageState createState() => _TodoListPageState();
}
class _TodoListPageState extends State<TodoListPage>{
  List<String> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return TodoAddPage();
              }),
            );
            if (newListText != null) {
              setState(() {
                todoList.add(newListText);
              });
            }
          },
          child: Icon(Icons.add)
      )
    );
  }
}
class TodoAddPage extends StatefulWidget{
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}
class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';
  @override
  showEmptyAlertText() async {
    var result = await showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('入力欄が空です'),
          content: Text('メモ欄を入力してください'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );}
    );}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'メモの内容を入力',
                hintText: 'メモの内容を入力',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blue
                  )
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue
                    )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blue
                  )
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue
                    )
                )
              ),
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                return (value != null && value.isEmpty) ? 'メモ欄を入力してください' : null;
              },
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'メモ入力欄',
            //     hintStyle: TextStyle(
            //       color: Colors.grey,
            //     )
            //   ),
            //   onChanged: (String value){
            //     setState(() {
            //       _text = value;
            //     });
            //   },
            // ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if (_text != '') {
                    Navigator.of(context).pop(_text);
                  }else{
                    showEmptyAlertText();
                  }
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 8,),
            // Container(
            //   width: double.infinity,
            //   child: TextButton(
            //     onPressed: (){
            //       Navigator.of(context).pop();
            //     },
            //     child: Text('キャンセル'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}