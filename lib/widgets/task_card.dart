import 'package:flutter/material.dart';

import 'package:todo_list/models/task.dart';

import '../helpers/format_datetime.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final void Function() deleteTask;
  final void Function() taskDone;
  final void Function() checkDeadLine;
  final bool isCompleteInTime;

  const TaskCard({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.taskDone,
    required this.checkDeadLine,
    required this.isCompleteInTime,
  });

  @override
  Widget build(BuildContext context) {
    final category = task.category;
    var theme = Theme.of(context);
    var titleSmallStyle = theme.textTheme.titleSmall!;
    var titleMediumStyle = theme.textTheme.titleMedium!;
    var titleLargeStyle = theme.textTheme.titleLarge!;
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
                      ? titleLargeStyle
                      : titleLargeStyle.copyWith(
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                        ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      category.icon,
                      color: Colors.blueAccent.shade700,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      category.categoryTitle,
                      style: titleMediumStyle,
                    )
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  formatDateTime(task.deadLineTime!),
                  style: titleSmallStyle.copyWith(
                    color: task.isCompleted
                        ? (task.isCompleteInTime
                            ? Colors.green.shade700
                            : Colors.red.shade700)
                        : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 30,
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
                  iconSize: 30,
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
