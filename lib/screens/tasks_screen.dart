import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_card.dart';
import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task) deleteTask;
  final void Function(Task) taskDone;
  final void Function(Task) checkDeadLine;
  const TasksScreen({
    super.key,
    required this.tasks,
    required this.deleteTask,
    required this.taskDone,
    required this.checkDeadLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: tasks
            .map(
              (tasks) => TaskCard(
                task: tasks,
                deleteTask: () => deleteTask(tasks),
                taskDone: () => taskDone(tasks),
                isCompleteInTime: tasks.isCompleteInTime,
                checkDeadLine: () => checkDeadLine(tasks),
              ),
            )
            .toList(),
      ),
    );
  }
}
