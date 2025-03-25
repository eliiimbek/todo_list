import 'package:flutter/material.dart';
import 'package:todo_list/halpers/format_datetime.dart';
import 'package:todo_list/models/task.dart';

class AddTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  const AddTask({super.key, required this.onTaskCreated});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var title = '';
  var selectedDate = DateTime.now();
  var selectedTimeOfDay = TimeOfDay.now();

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTimeOfDay);
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onDateTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final dateFromUser = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        dateController.text = formatDate(dateFromUser);
      });
    }
  }

  void onTimeTap() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDay,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTimeOfDay = pickedTime;
        timeController.text = formatTime(pickedTime);
      });
    }
  }

  void onAdd() {
    final dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTimeOfDay.hour,
      selectedTimeOfDay.minute,
    );

    final newTodo = Task(
      taskTitle: title,
      isCompleted: false,
      deadLineTime: dateTime,
      completeTime: DateTime.now(),
      isCompleteInTime: false,
    );
    widget.onTaskCreated(newTodo);
    onCanceled();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var titleSmallStyle = theme.textTheme.titleSmall!;
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
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3.0),
                    ),
                    label: Text(
                      'Новая задача',
                      style: titleSmallStyle.copyWith(
                        color: Color.fromRGBO(28, 28, 28, 100),
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    title = value;
                  }),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: onDateTap,
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3.0),
                    ),
                    label: Text(
                      'Date',
                      style: titleSmallStyle.copyWith(
                        color: Color.fromRGBO(28, 28, 28, 100),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 100,
                child: TextField(
                  onTap: onTimeTap,
                  readOnly: true,
                  controller: timeController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3.0),
                    ),
                    label: Text(
                      'Time',
                      style: titleSmallStyle.copyWith(
                        color: Color.fromRGBO(28, 28, 28, 100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onAdd,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  child: Text(
                    'Add',
                    style: titleSmallStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  onPressed: onCanceled,
                  child: Text(
                    'Cancel',
                    style: titleSmallStyle.copyWith(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
