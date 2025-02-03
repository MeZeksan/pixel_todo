import 'package:flutter/material.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskLabel extends StatelessWidget {
  const TaskLabel({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 80,
      right: 56,
      child: Text(
        task.taskTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: "TeletactileRus",
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
