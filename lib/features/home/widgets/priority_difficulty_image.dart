// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pixel_todo/core/colors/app_colors.dart';
import 'package:pixel_todo/features/home/service/service.dart';
import 'package:pixel_todo/models/task/task.dart';

class PriorityDifficultyImage extends StatelessWidget {
  const PriorityDifficultyImage({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 70,
      left: 52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              AppColors.difficultyColors[task.difficulty]!.withOpacity(1),
              BlendMode.modulate,
            ),
            child: Image.asset(
              GetDifficultyImageService.getDifficultyImage(task.difficulty),
              width: 23,
              height: 25,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ],
      ),
    );
  }
}
