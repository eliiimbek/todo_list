import 'package:todo_list/data/categories_data.dart';
import 'package:todo_list/models/task_category.dart';

class Task {
  final String taskTitle;
  bool isCompleted;
  DateTime? deadLineTime;
  DateTime? completeTime;
  bool isCompleteInTime;
  final String categoryId;

  Task({
    required this.isCompleted,
    required this.taskTitle,
    this.deadLineTime,
    required this.completeTime,
    required this.isCompleteInTime,
    required this.categoryId,
  });

  TaskCategory get category {
    return categories.firstWhere((c) => c.id == categoryId);
  }
}
