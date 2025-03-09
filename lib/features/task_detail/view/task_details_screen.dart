import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/features/task_detail/widgets/widgets.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task initialTask;

  const TaskDetailsScreen({
    super.key,
    required this.initialTask,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailBloc(initialTask),
      child: Scaffold(
        appBar: const TaskDetailsAppBar(),
        body: BlocBuilder<TaskDetailBloc, TaskDetailState>(
          builder: (context, state) {
            final task = state.task;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskTitleField(task: task),
                    const SizedBox(height: 16),
                    TaskDescriptionField(task: task),
                    const SizedBox(height: 16),
                    TaskStatusWidget(task: task),
                    const SizedBox(height: 16),
                    const Text('Приоритет:', style: AppStyles.defaultTextStyle),
                    const SizedBox(height: 8),
                    const TaskPriorityWidget(),
                    const SizedBox(height: 16),
                    const Text('Сложность:', style: AppStyles.defaultTextStyle),
                    const TaskDifficultyWidget(),
                    const SizedBox(height: 16),
                    TaskChooseDateWidget(task: task)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TaskDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Указываем высоту AppBar
  const TaskDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Квест',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: "TeletactileRus",
          fontSize: 20,
        ),
      ),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // Используем context, который находится внутри BlocProvider
                context.read<TaskDetailBloc>().add(SaveTaskEvent());
                Navigator.pop(context, true);
              },
            );
          },
        ),
      ],
    );
  }
}
