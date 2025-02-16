import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class DeleteTaskDialog extends StatelessWidget {
  final Task task; // Задача для удаления

  const DeleteTaskDialog({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.transparent,
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
                SizedBox(
                  width: 240,
                  child: Text(
                      "Вы точно хотите удалить задачу\n'${task.taskTitle}'?",
                      textAlign: TextAlign.center,
                      style: AppStyles.bigTextStyle),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Отправляем событие DeleteTask в BLoC
                        context
                            .read<HomeBloc>()
                            .add(DeleteTask(taskId: task.id));

                        // Закрываем диалог
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      child: const Text(
                        "Да",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "TeletactileRus",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Закрываем диалог без удаления
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                      child: const Text(
                        "Нет",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "TeletactileRus",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
