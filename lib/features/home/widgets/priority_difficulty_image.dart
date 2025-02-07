import 'package:flutter/material.dart';
import 'package:pixel_todo/core/colors/app_colors.dart';
import 'package:pixel_todo/features/home/service/service.dart';
import 'package:pixel_todo/models/task/task.dart';

class PriorityDifficultyImage extends StatelessWidget {
  const PriorityDifficultyImage({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      child: Column(
        children: [
          // Изображение приоритета
          Image.asset(
            GetPriorityImageService.getPriorityImage(task.priority),
            width: 25,
            height: 25,
          ),
          const SizedBox(height: 7),

          // Изображение сложности с цветовым фильтром
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              AppColors.difficultyColors[task.difficulty]!.withOpacity(1.0),
              BlendMode.modulate,
            ),
            child: Image.asset(
              GetDifficultyImageService.getDiffucultyImage(task.difficulty),
              width: 30,
              height: 30,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ],
      ),
    );
  }
}
