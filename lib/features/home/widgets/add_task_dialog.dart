import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';
import 'package:uuid/uuid.dart'; // For generating unique IDs

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
                  onPressed: () {
                    final newTask = taskController.text;
                    if (newTask.isNotEmpty) {
                      // Generate a unique ID for the new task
                      final taskId = const Uuid().v4();

                      // Create a new task with the generated ID
                      final addTask = Task(
                        id: taskId, // Pass the unique ID
                        taskTitle: newTask,
                        isCompleted: false,
                        taskDescription: '',
                        priority: 0, // Default priority
                      );

                      // Add the task to the Hive box using its ID
                      taskBox.put(taskId, addTask);

                      // Close the dialog
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
