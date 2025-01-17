import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;
  final int index;

  const TaskDetailsScreen({super.key, required this.task, required this.index});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late String _taskTitle;
  late String _taskDescription;
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _taskTitle = widget.task.taskTitle;
    _taskDescription = widget.task.taskDescription;
    _isCompleted = widget.task.isCompleted;
  }

  void _saveTask() {
    final taskBox = Hive.box<Task>('todo_box_name');
    final updatedTask = Task(
      taskTitle: _taskTitle,
      isCompleted: _isCompleted,
      taskDescription: _taskDescription,
    );
    taskBox.putAt(widget.index, updatedTask);
    Navigator.pop(context); // Возвращаемся на предыдущую страницу
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTask, // Сохраняем изменения при нажатии
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Task Title'),
              controller: TextEditingController(text: _taskTitle)
                ..selection =
                    TextSelection.collapsed(offset: _taskTitle.length),
              onChanged: (value) {
                _taskTitle = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Task Description'),
              controller: TextEditingController(text: _taskDescription)
                ..selection =
                    TextSelection.collapsed(offset: _taskDescription.length),
              maxLines: 5,
              onChanged: (value) {
                _taskDescription = value;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Completed:'),
                Switch(
                  value: _isCompleted,
                  onChanged: (value) {
                    setState(() {
                      _isCompleted = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
