import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

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
            right: 56, // Отступ для кнопки удаления
            child: Text(
              task.taskTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "TeletactileRus"),
            ),
          ),
          Positioned(
            right: 16, // Позиция кнопки удаления
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                taskBox.deleteAt(index); // Удаление задачи из коробки
              },
            ),
          ),
        ],
      ),
    );
  }
}
