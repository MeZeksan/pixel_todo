import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskTitleField extends StatelessWidget {
  const TaskTitleField({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: TextEditingController(text: task.taskTitle),
        onChanged: (value) => context.read<TaskDetailBloc>().add(
              UpdateTaskTitle(value),
            ),
        style: AppStyles.defaultTextStyle);
  }
}
