import 'package:flutter/material.dart';
import 'package:todo_list/screens/todo_list_screen.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO list'),
      ),
      body: TodoListScreen(),
    );
  }
}
