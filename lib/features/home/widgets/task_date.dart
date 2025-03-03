// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pixel_todo/models/task/task.dart';

class TaskDate extends StatelessWidget {
  const TaskDate({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 80,
      bottom: 18,
      child: Text(
        task.dueDate == null ? '' : "Дата: ${task.dueDate!.toString().split(' ')[0]}",
        style: TextStyle(
          color: const Color.fromARGB(255, 81, 81, 81),
          fontSize: 14,
          fontFamily: 'TeletactileRus',
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
