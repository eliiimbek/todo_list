import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/screens/tasks_screen.dart';
import 'package:todo_list/widgets/add_task.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TodoListState();
}

class _TodoListState extends State<TasksList> {
  List<Tasks> tasks = [
    Tasks(taskTitle: 'Пойти на саппорт', isCompleted: false),
    Tasks(taskTitle: 'Купить хлеб', isCompleted: false),
    Tasks(taskTitle: 'Стать узбеком', isCompleted: false),
    Tasks(taskTitle: 'Приготовить плов', isCompleted: false),
  ];

  void addTaskSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddTask(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Tasks',
          style: theme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: addTaskSheet,
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TasksScreen(tasks: tasks),
      ),
    );
  }
}
