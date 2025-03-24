class Task {
  final String taskTitle;
  bool isCompleted;
  DateTime? deadLineTime;
  DateTime? completeTime;

  Task({
    required this.isCompleted,
    required this.taskTitle,
    required this.deadLineTime,
    required this.completeTime,
  });
}
