// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 23,
      child: Checkbox(
        activeColor: Colors.deepPurple,
        checkColor: Colors.lightGreen,
        value: task.isCompleted,
        onChanged: (value) {
          // Создаем обновленную версию задачи с помощью copyWith
          final updatedTask = task.copyWith(isCompleted: value ?? false);
          //отправляем  событие UpdateTask через Bloc
          context.read<HomeBloc>().add(UpdateTaskEvent(updatedTask));
        },
      ),
    );
  }
}
