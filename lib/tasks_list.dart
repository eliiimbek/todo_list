import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/screens/tasks_screen.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TodoListState();
}

class _TodoListState extends State<TasksList> {
  List<Tasks> tasks = [
    Tasks(taskTitle: 'Пойти на саппорт'),
    Tasks(taskTitle: 'Купить хлеб'),
    Tasks(taskTitle: 'Стать узбеком'),
    Tasks(taskTitle: 'Приготовить плов'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Tasks',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TasksScreen(tasks: tasks),
      ),
    );
  }
}
