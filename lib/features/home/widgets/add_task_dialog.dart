// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
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
            width: 350,
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
                const Text("Новая задача", style: AppStyles.bigTextStyle),
                const SizedBox(height: 16),
                SizedBox(
                  width: 245,
                  child: AddTaskTextField(taskController: taskController),
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
                      context.read<HomeBloc>().add(AddTaskEvent(newTask));

                      // Закрываем диалог
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Добавить", style: AppStyles.defaultTextStyle),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Image.asset(
                'assets/images/delete_task.png',
                width: 15,
                height: 15,
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
