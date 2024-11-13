import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/task/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO сделать действие
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset(
          'assets/images/feather.png',
          width: 56,
          height: 56,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: theme.primaryColor,
                width: double.infinity,
                child: const Column(children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('Просто текст'),
                ]),
              ),
            ),
            const Expanded(
                flex: 4, child: CustomScrollView(slivers: [SliverTasks()]))
          ],
        ),
      ),
    );
  }
}

class SliverTasks extends StatefulWidget {
  const SliverTasks({
    super.key,
  });

  @override
  State<SliverTasks> createState() => _SliverTasksState();
}

class _SliverTasksState extends State<SliverTasks> {
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

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;

  const TaskItem({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final Box<Task> taskBox = Hive.box<Task>('todo_box_name');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/pergament.png',
            width: double.infinity,
            height: 100,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 16,
            child: Checkbox(
              activeColor: Colors.red,
              checkColor: Colors.blue,
              value: task.isCompleted,
              onChanged: (value) {
                taskBox.putAt(
                    index,
                    Task(
                        taskTitle: task.taskTitle,
                        isCompleted: value ?? false));
              },
            ),
          ),
          Positioned(
            left: 60,
            child: Text(
              task.taskTitle,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: "TeletactileRus"),
            ),
          ),
        ],
      ),
    );
  }
}
