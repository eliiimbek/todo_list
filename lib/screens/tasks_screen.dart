import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_card.dart';
import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  final List<Tasks> tasks;
  const TasksScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: tasks.map((tasks) => TaskCard(tasks: tasks)).toList(),
      ),
    );
  }
}
