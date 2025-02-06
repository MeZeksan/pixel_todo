import 'package:flutter/material.dart';
import 'package:pixel_todo/features/home/service/service.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDeleteButton extends StatelessWidget {
  const TaskDeleteButton({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      child: IconButton(
        icon: Image.asset(
          'assets/images/delete_task.png',
          width: 25,
          height: 25,
        ),
        onPressed: () {
          ShowDeleteDialogService.showDeleteDialog(context, task);
        },
      ),
    );
  }
}
