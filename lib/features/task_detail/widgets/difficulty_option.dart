import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/colors/app_colors.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';

class DifficultyOption extends StatelessWidget {
  final int difficultyLevel;
  final String imagePath;

  const DifficultyOption({
    super.key,
    required this.difficultyLevel,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<TaskDetailBloc>().add(
            UpdateTaskDifficulty(difficultyLevel),
          ),
      child: BlocBuilder<TaskDetailBloc, TaskDetailState>(
        builder: (context, state) {
          final isSelected = state.task.difficulty == difficultyLevel;

          return Container(
            decoration: BoxDecoration(
              border:
                  isSelected ? Border.all(color: Colors.blue, width: 3) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                AppColors.difficultyColors[difficultyLevel]!.withOpacity(
                  isSelected ? 1.0 : 0.7, // Меняем прозрачность, если не выбран
                ),
                BlendMode.modulate,
              ),
              child: Image.asset(
                imagePath,
                width: 70,
                height: 75,
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          );
        },
      ),
    );
  }
}
