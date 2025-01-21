import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';
import 'package:uuid/uuid.dart'; // For generating unique IDs

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({
    super.key,
  });

  final TextEditingController taskController = TextEditingController();
  final Box<Task> taskBox = GetIt.I<Box<Task>>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Сделаем фон диалога прозрачным
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.transparent, // Сделаем фон контейнера прозрачным
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/pergament.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
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
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "TeletactileRus",
                      fontSize: 14),
                  maxLines: 2,
                  controller: taskController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Введите задачу',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "TeletactileRus",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    final newTask = taskController.text;
                    if (newTask.isNotEmpty) {
                      // генерация уникального id для задачи
                      final taskId = const Uuid().v4();

                      final addTask = Task(
                        id: taskId,
                        taskTitle: newTask,
                        isCompleted: false,
                        taskDescription: '',
                        priority: 0,
                      );

                      // Добавление задачи происходит по id
                      // небольшая неудача - (задачи в разброс из-за вида ключа)
                      taskBox.put(taskId, addTask);

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Добавить",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "TeletactileRus",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалог
              },
            ),
          ),
        ],
      ),
    );
  }
}
