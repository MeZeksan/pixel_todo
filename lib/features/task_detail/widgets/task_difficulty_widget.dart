// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pixel_todo/features/task_detail/widgets/widgets.dart';

class TaskDifficultyWidget extends StatelessWidget {
  const TaskDifficultyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DifficultyOption(
          difficultyLevel: 0,
          imagePath: 'assets/images/easy_difficulty.png',
        ),
        DifficultyOption(
          difficultyLevel: 1,
          imagePath: 'assets/images/medium_difficulty.png',
        ),
        DifficultyOption(
          difficultyLevel: 2,
          imagePath: 'assets/images/hard_difficulty.png',
        ),
        DifficultyOption(
          difficultyLevel: 3,
          imagePath: 'assets/images/insane_difficulty.png',
        ),
      ],
    );
  }
}
