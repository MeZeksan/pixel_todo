import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDescriptionField extends StatelessWidget {
  const TaskDescriptionField({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.defaultTextStyle,
      decoration: const InputDecoration(
        labelText: 'Описание квеста',
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: "TeletactileRus",
        ),
      ),
      controller: TextEditingController(text: task.taskDescription),
      maxLines: 10,
      onChanged: (value) => context.read<TaskDetailBloc>().add(
            UpdateTaskDescription(value),
          ),
    );
  }
}
