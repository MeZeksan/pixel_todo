import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/features/home/widgets/task_item.dart';
import 'package:pixel_todo/models/task/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

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
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final task = box.getAt(index);
              return task != null
                  ? TaskItem(task: task, index: index)
                  : Container();
            },
            childCount: box.length,
          ),
        );
      },
    );
  }
}
