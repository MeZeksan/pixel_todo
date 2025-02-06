import 'package:flutter/material.dart';
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
      // Добавляем изображение в зависимости от приоритета
      left: 50,
      child: Column(
        children: [
          Image.asset(
            GetPriorityImageService.getPriorityImage(task.priority),
            width: 25,
            height: 25,
          ),
          const SizedBox(
            height: 7,
          ),
          Image.asset(
            GetDifficultyImageService.getDiffucultyImage(task.difficulty),
            width: 25,
            height: 25,
          ),
        ],
      ),
    );
  }
}
