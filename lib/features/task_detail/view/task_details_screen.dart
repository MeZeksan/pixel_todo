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
      taskTitle: _taskTitle,
      isCompleted: _isCompleted,
      taskDescription: _taskDescription,
      priority: _priority,
    );
    taskBox.putAt(widget.index, updatedTask);
    Navigator.pop(context); // Возвращаемся на предыдущую страницу
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
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "TeletactileRus",
              ),
              decoration: const InputDecoration(
                labelText: 'Название задачи',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "TeletactileRus",
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
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPriorityOption(0,
                    'assets/images/catbox.png'), // Пример для низкого приоритета
                _buildPriorityOption(
                    1, 'assets/images/catbox.png'), // Средний приоритет
                _buildPriorityOption(
                    2, 'assets/images/catbox.png'), // Высокий приоритет
              ],
            ),
          ],
        ),
      ),
    );
  }
}
