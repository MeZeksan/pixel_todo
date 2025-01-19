import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/features/home/widgets/task_item.dart';
import 'package:pixel_todo/models/task/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _SliverTasksState();
}

class _SliverTasksState extends State<TasksList> {
  final Box<Task> taskBox = GetIt.I<Box<Task>>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, Box<Task> box, _) {
        if (box.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Нет задач')),
          );
        }

        // Fetch all tasks and sort them by priority
        final List<Task> tasks = box.values.toList()
          ..sort((a, b) => a.priority.compareTo(b.priority));

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final task = tasks[index];
              return TaskItem(task: task, index: index);
            },
            childCount: tasks.length,
            findChildIndexCallback: (key) {
              if (key is ValueKey<int>) {
                final taskId = key.value;
                final task = tasks.firstWhere((task) => task.id == taskId);
                return tasks.indexOf(task);
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
