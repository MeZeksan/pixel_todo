// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskStatusWidget extends StatelessWidget {
  const TaskStatusWidget({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Статус квеста:', style: AppStyles.defaultTextStyle),
        Switch(
          value: task.isCompleted,
          onChanged: (value) => context.read<TaskDetailBloc>().add(
                UpdateTaskStatusEvent(value),
              ),
        ),
      ],
    );
  }
}
