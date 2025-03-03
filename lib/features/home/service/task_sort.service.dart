// Project imports:
import 'package:pixel_todo/models/task/task.dart';

class TaskSortService {
  static List<Task> sortTasksByPriorityAndDueDate(List<Task> tasks) {
    final sortedTask = tasks
      ..sort((a, b) {
        // Сначала проверяем приоритет
        if (b.priority != a.priority) {
          return b.priority.compareTo(a.priority); // Сортируем по убыванию приоритета
        }

        // Если приоритет одинаковый, проверяем даты
        if (a.dueDate == null && b.dueDate == null) {
          return 0; // Обе задачи без даты
        }

        if (a.dueDate == null) {
          return 1; // Задачи без даты идут после
        }

        if (b.dueDate == null) {
          return -1; // Задачи с датой идут раньше
        }

        // Если обе даты не нулевые, сравниваем их
        return a.dueDate!.compareTo(b.dueDate!);
      });

    return sortedTask;
  }
}
