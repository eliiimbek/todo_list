class Task {
  final String taskTitle;
  bool isCompleted;
  DateTime? deadLineTime;
  DateTime? completeTime;
  bool isCompleteInTime;

  Task({
    required this.isCompleted,
    required this.taskTitle,
    this.deadLineTime,
    required this.completeTime,
    required this.isCompleteInTime,
  });
}
