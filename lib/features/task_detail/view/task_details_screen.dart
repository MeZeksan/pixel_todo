import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late String _taskTitle;
  late String _taskDescription;
  late bool _isCompleted;
  late int _priority;

  @override
  void initState() {
    super.initState();
    _taskTitle = widget.task.taskTitle;
    _taskDescription = widget.task.taskDescription;
    _isCompleted = widget.task.isCompleted;
    _priority = widget.task.priority;
  }

  void _saveTask() {
    final taskBox = Hive.box<Task>('todo_box_name');
    final updatedTask = Task(
      id: widget.task.id, // Use the task's id
      taskTitle: _taskTitle,
      isCompleted: _isCompleted,
      taskDescription: _taskDescription,
      priority: _priority,
    );
    taskBox.put(widget.task.id, updatedTask); // Save using the task's id
    Navigator.pop(context); // Return to the previous screen
  }

  Widget _buildPriorityOption(int priorityLevel, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _priority = priorityLevel;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: _priority == priorityLevel
              ? Border.all(color: Colors.blue, width: 3)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(imagePath, width: 50, height: 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задача'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTask, // Save changes when pressed
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "TeletactileRus",
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                labelText: 'Название задачи',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "TeletactileRus",
                  fontSize: 14,
                ),
              ),
              controller: TextEditingController(text: _taskTitle)
                ..selection =
                    TextSelection.collapsed(offset: _taskTitle.length),
              onChanged: (value) {
                _taskTitle = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "TeletactileRus",
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                labelText: 'Описание задачи',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "TeletactileRus",
                ),
              ),
              controller: TextEditingController(text: _taskDescription)
                ..selection =
                    TextSelection.collapsed(offset: _taskDescription.length),
              maxLines: 10,
              onChanged: (value) {
                _taskDescription = value;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Статус задачи:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "TeletactileRus",
                    fontSize: 14,
                  ),
                ),
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
            const SizedBox(height: 16),
            const Text(
              'Приоритет:',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "TeletactileRus",
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPriorityOption(
                    0, 'assets/images/easy.png'), // Low priority
                _buildPriorityOption(
                    1, 'assets/images/medium.png'), // Medium priority
                _buildPriorityOption(
                    2, 'assets/images/hard.png'), // High priority
              ],
            ),
          ],
        ),
      ),
    );
  }
}
