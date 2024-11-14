import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({
    super.key,
    required this.taskController,
    required this.taskBox,
  });

  final TextEditingController taskController;
  final Box<Task> taskBox;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/pergament.png"),
                fit: BoxFit.fill,
              ),
            ),
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
                  onPressed: () {
                    final newTask = taskController.text;
                    if (newTask.isNotEmpty) {
                      var addTask = Task(taskTitle: newTask);
                      taskBox.add(addTask);
                      Navigator.of(context).pop(); // Закрыть диалог
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
