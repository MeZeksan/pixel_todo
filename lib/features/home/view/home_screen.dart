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
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage(
                        "assets/images/pergament.png"), //TODO надо заменить на нормальную картинку
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Новая задача",
                  style: TextStyle(
                    fontFamily: "TeletactileRus",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: taskController,
                  decoration: const InputDecoration(
                      // fillColor: Color.fromARGB(255, 105, 93, 78),
                      // filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Введите задачу',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "TeletactileRus")),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Логика добавления задачи
                        final newTask = taskController.text;
                        if (newTask.isNotEmpty) {
                          var addTask = Task(taskTitle: newTask);
                          taskBox.add(addTask);
                          Navigator.of(context)
                              .pop(); // Закрыть диалог после добавления
                        }
                      },
                      child: const Text(
                        "Добавить",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "TeletactileRus"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Отменить",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "TeletactileRus"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
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
