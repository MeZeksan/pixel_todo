import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';

class DifficultyOption extends StatelessWidget {
  final int difficultyLevel;
  final String imagePath;
  const DifficultyOption(
      {super.key, required this.difficultyLevel, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    {
      return GestureDetector(
        onTap: () => context.read<TaskDetailBloc>().add(
              UpdateTaskDifficulty(difficultyLevel),
            ),
        child: BlocBuilder<TaskDetailBloc, TaskDetailState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                border: state.task.difficulty == difficultyLevel
                    ? Border.all(color: Colors.blue, width: 3)
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(imagePath, width: 50, height: 50),
            );
          },
        ),
      );
    }
  }
}
