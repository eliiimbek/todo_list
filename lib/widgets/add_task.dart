import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class AddTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  const AddTask({super.key, required this.onTaskCreated});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var title = '';

  void onCanceled() {
    Navigator.pop(context);
  }

  void onAdd() {
    final newTodo = Task(
      taskTitle: title,
      isCompleted: false,
      deadLineTime: null,
      completeTime: null,
    );
    widget.onTaskCreated(newTodo);
    onCanceled();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(label: Text('New task')),
                  onChanged: (value) => setState(() {
                    title = value;
                  }),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onAdd,
                  child: Text('Add'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: onCanceled,
                  child: Text('Cancel'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
