import 'package:flutter/material.dart';
import 'package:todo_list/halpers/format_datetime.dart';
import 'package:todo_list/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final void Function() deleteTask;
  final void Function() taskDone;
  const TaskCard({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.taskDone,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme.titleMedium;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueAccent, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.taskTitle,
                  style: !task.isCompleted
                      ? theme
                      : theme!.copyWith(
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                        ),
                ),
                Text(formatDateTime(task.completeTime!)),
              ],
            ),
            Row(
              children: [
                IconButton(
                  color: Colors.blueAccent,
                  icon: Icon(
                    task.isCompleted
                        ? Icons.check_circle
                        : Icons.check_circle_outline,
                  ),
                  onPressed: taskDone,
                ),
                IconButton(
                  onPressed: deleteTask,
                  icon: Icon(Icons.delete_forever_outlined),
                  color: Colors.blueAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
