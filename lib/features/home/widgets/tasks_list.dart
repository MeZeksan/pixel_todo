import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/service/service.dart';
import 'package:pixel_todo/features/home/widgets/task_item.dart';
import 'package:pixel_todo/models/task/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _SliverTasksState();
}

class _SliverTasksState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          final tasksList = state.tasks.values.toList();
          if (tasksList.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'Нет доступных квестов',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 191, 191, 191),
                      fontFamily: "TeletactileRus",
                    ),
                  ),
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
                final task = sortedTasks[index];
                return TaskItem(
                  task: task,
                  key: ValueKey(task.id),
                  taskBox: state.tasks,
                );
              },
              childCount: sortedTasks.length,
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
