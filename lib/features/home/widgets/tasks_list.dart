import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/service/service.dart';
import 'package:pixel_todo/features/home/widgets/task_item.dart';
import 'package:pixel_todo/models/task/task.dart';

class TasksList extends StatefulWidget {
  final bool isActive;
  const TasksList({super.key, required this.isActive});

  @override
  State<TasksList> createState() => _SliverTasksState();
}

class _SliverTasksState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          final tasksBox =
              widget.isActive ? state.activeTask : state.completeTask;
          final tasksList = tasksBox.values.toList();
          if (tasksList.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text('Нет доступных квестов',
                      style: AppStyles.bigHintStyle),
                ),
              ),
            );
          }

          // Сортируем задачи
          final List<Task> sortedTasks =
              TaskSortService.sortTasksByPriorityAndDueDate(tasksList);

          // Возвращаем список задач
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < sortedTasks.length) {
                  //в конце списка отступ, чтобы можно было удалить задачу
                  final task = sortedTasks[index];
                  return TaskItem(
                    task: task,
                    key: ValueKey(task.id),
                    taskBox: tasksBox,
                  );
                } else {
                  return const SizedBox(height: 30);
                }
              },
              childCount: sortedTasks.length +
                  1, // Увеличиваем количество элементов на 1
            ),
          );
        } else if (state is HomeError) {
          // Показываем сообщение об ошибке
          return SliverToBoxAdapter(
            child: Center(child: Text('Ошибка: ${state.toString()}')),
          );
        }

        // Default case
        return const SliverToBoxAdapter();
      },
    );
  }
}
