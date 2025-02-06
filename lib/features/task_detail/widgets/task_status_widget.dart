import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        const Text(
          'Статус квеста:',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "TeletactileRus",
            fontSize: 14,
          ),
        ),
        Switch(
          value: task.isCompleted,
          onChanged: (value) => context.read<TaskDetailBloc>().add(
                UpdateTaskStatus(value),
              ),
        ),
      ],
    );
  }
}
