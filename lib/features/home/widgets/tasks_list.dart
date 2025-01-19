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
            )),
          );
        }

        // Сортировка по приоритету
        final List<Task> tasks = box.values.toList()
          ..sort((a, b) => b.priority.compareTo(a.priority));

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final task = tasks[index];
              return TaskItem(task: task, key: ValueKey(task.id));
            },
            childCount: tasks.length,
          ),
        );
      },
    );
  }
}
