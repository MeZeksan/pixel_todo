// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pixel_todo/core/styles/app_styles.dart';
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
      child: Text(task.taskTitle,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: task.isCompleted ? AppStyles.completedTextStyle : AppStyles.defaultTextStyle),
    );
  }
}
