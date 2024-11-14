import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
import 'package:pixel_todo/models/task/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showCustomDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    final Box<Task> taskBox = GetIt.I<Box<Task>>();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(taskController: taskController, taskBox: taskBox);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCustomDialog(context); // Вызов метода показа диалога
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
                flex: 4, child: CustomScrollView(slivers: [TasksList()])),
          ],
        ),
      ),
    );
  }
}
