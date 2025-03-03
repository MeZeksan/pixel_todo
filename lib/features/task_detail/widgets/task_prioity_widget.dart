// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pixel_todo/features/task_detail/widgets/widgets.dart';

class TaskPriorityWidget extends StatelessWidget {
  const TaskPriorityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PriorityOption(
          priorityLevel: 0,
          imagePath: 'assets/images/low_priority.png',
        ),
        PriorityOption(
          priorityLevel: 1,
          imagePath: 'assets/images/medium_priority.png',
        ),
        PriorityOption(
          priorityLevel: 2,
          imagePath: 'assets/images/top_priority.png',
        ),
      ],
    );
  }
}
