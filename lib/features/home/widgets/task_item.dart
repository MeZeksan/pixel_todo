import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/features/task_detail/view/view.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;

  const TaskItem({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final Box<Task> taskBox = Hive.box<Task>('todo_box_name');

// Функция для выбора картинки в зависимости от приоритета
    String getPriorityImage(int priority) {
      switch (priority) {
        case 0:
          return 'assets/images/easy.png'; // Изображение для низкого приоритета
        case 1:
          return 'assets/images/medium.png'; // Изображение для среднего приоритета
        case 2:
          return 'assets/images/hard.png'; // Изображение для высокого приоритета
        default:
          return 'assets/images/catbox.png'; // По умолчанию низкий приоритет
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsScreen(task: task, index: index),
            ),
          );
        },
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
                activeColor: Colors.deepPurple,
                checkColor: Colors.lightGreen,
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
              // Добавляем изображение в зависимости от приоритета
              left: 50,
              child: Image.asset(
                getPriorityImage(task.priority),
                width: 25,
                height: 25,
              ),
            ),
            Positioned(
              left: 80,
              right: 56, // Отступ для кнопки удаления
              child: Text(
                task.taskTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "TeletactileRus",
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            Positioned(
              right: 16, // Позиция кнопки удаления
              child: IconButton(
                icon: const Icon(Icons.delete,
                    color: Color.fromARGB(255, 65, 65, 65)),
                onPressed: () {
                  taskBox.deleteAt(index); // Удаление задачи из коробки
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
