import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ToDo {
  bool isDone = false; // 현재 상태
  String title; // 해야할 일

  ToDo(this.title);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  // 할일 저장할 리스트
  final _items = <ToDo>[];
  // 할일 문자열 다룰 컨트롤러
  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose(); // 컨트롤러는 종료시 반드시 해제해줘야 함
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text(
                    '추가하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: _items.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildItemWidget(ToDo todo) {
  return ListTile(
    onTap: () {
      // 클릭시
    },
    trailing: IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {},
    ),
    title: Text(
      todo.title,
      style: todo.isDone
          ? TextStyle(
              decoration: TextDecoration.lineThrough,
              fontStyle: FontStyle.italic,
            )
          : null,
    ),
  );
}
