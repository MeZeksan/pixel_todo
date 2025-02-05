import 'package:flutter/material.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
import 'package:pixel_todo/features/task_detail/view/view.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsScreen(task: task),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/pergament.png',
              width: double.infinity,
              height: 100,
              fit: BoxFit.fill,
            ),
            TaskCheckBox(task: task),
            PriorityDifficultyImage(task: task),
            TaskLabel(task: task),
            TaskDate(task: task),
            TaskDeleteButton(task: task),
          ],
        ),
      ),
    );
  }
}
