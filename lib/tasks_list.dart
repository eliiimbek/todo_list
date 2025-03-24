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
  List<Task> tasks = [
    Task(
      taskTitle: 'Пойти на саппорт',
      isCompleted: false,
      deadLineTime: null,
      completeTime: DateTime.now(),
    ),
    Task(
      taskTitle: 'Купить хлеб',
      isCompleted: false,
      deadLineTime: null,
      completeTime: DateTime.now(),
    ),
    Task(
      taskTitle: 'Посмотреть сериал',
      isCompleted: false,
      deadLineTime: null,
      completeTime: DateTime.now(),
    ),
    Task(
      taskTitle: 'Принять ванну',
      isCompleted: false,
      deadLineTime: null,
      completeTime: DateTime.now(),
    ),
  ];

  void removeTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void taskComplete(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  void addTask(Task addTask) {
    setState(() {
      tasks.add(addTask);
    });
  }

  void addTaskSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddTask(
        onTaskCreated: addTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleLargeStyle = theme.textTheme.titleLarge!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Tasks',
          style: titleLargeStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
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
        child: TasksScreen(
          tasks: tasks,
          deleteTask: removeTask,
          taskDone: taskComplete,
        ),
      ),
    );
  }
}
