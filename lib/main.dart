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
      home: ToDoListPage(title: 'ToDo App'),
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
      body: Container(),
    );
  }
}
