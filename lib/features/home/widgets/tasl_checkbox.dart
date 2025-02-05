import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          //отправляем  событие UpdateTask через Bloc
          context.read<HomeBloc>().add(UpdateTask(updatedTask));
        },
      ),
    );
  }
}
