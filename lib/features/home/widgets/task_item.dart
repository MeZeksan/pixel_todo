import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
import 'package:pixel_todo/features/task_detail/view/view.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      // Здесь можно обработать изменения состояния, если нужно
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GestureDetector(
          onTap: () async {
            // Ожидаем возврата из TaskDetailsScreen
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailsScreen(
                  initialTask: task,
                ),
              ),
            );
            // Если результат true -обновляем задачи
            if (result == true) context.read<HomeBloc>().add(LoadTasks());
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
    });
  }
}
