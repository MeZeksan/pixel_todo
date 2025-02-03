import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    super.key,
    required this.task,
    required this.taskBox,
  });

  final Task task;
  final Box<Task> taskBox;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      child: Checkbox(
        activeColor: Colors.deepPurple,
        checkColor: Colors.lightGreen,
        value: task.isCompleted,
        onChanged: (value) {
          // Обновление задачи по id
          final updatedTask = Task(
              id: task.id,
              taskTitle: task.taskTitle,
              isCompleted: value ?? false,
              taskDescription: task.taskDescription,
              priority: task.priority,
              difficulty: task.difficulty,
              dueDate: task.dueDate);
          taskBox.put(task.id, updatedTask);
        },
      ),
    );
  }
}
