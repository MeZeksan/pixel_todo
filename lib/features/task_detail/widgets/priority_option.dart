import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';

class PriorityOption extends StatelessWidget {
  final int priorityLevel;
  final String imagePath;

  const PriorityOption({
    super.key,
    required this.priorityLevel,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<TaskDetailBloc>().add(
            UpdateTaskPriority(priorityLevel),
          ),
      child: BlocBuilder<TaskDetailBloc, TaskDetailState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              border: state.task.priority == priorityLevel
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
