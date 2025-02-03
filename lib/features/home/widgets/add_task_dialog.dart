import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';
import 'package:uuid/uuid.dart'; // For generating unique IDs

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({super.key});

  final TextEditingController taskController = TextEditingController();

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
                const SizedBox(height: 20),
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
                    fontSize: 14,
                  ),
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
                    final newTaskTitle = taskController.text.trim();
                    if (newTaskTitle.isNotEmpty) {
                      // Создаем новую задачу
                      final taskId = const Uuid().v4();
                      final newTask = Task(
                        id: taskId,
                        taskTitle: newTaskTitle,
                        isCompleted: false,
                        taskDescription: '',
                        priority: 0,
                      );

                      // Смы вытаскиваем экземпляр HomeBloc из дерева виджетов
                      //затем отправляем событие AddTask
                      context.read<HomeBloc>().add(AddTask(newTask));

                      // Закрываем диалог
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
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Image.asset(
                'assets/images/delete_task.png',
                width: 25,
                height: 25,
              ),
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
