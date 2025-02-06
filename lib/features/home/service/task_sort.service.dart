// Сортировка по приоритету и внутри приоритета по дате
import 'package:pixel_todo/models/task/task.dart';

class TaskSortService {
  static List<Task> sortTasksByPriorityAndDueDate(List<Task> tasks) {
    final List<Task> sortedTask = tasks
      ..sort((a, b) {
        // Сначала сортируем по приоритету в порядке убывания
        final priorityComparison = b.priority.compareTo(a.priority);
        if (priorityComparison != 0) {
          return priorityComparison;
        }

        // Если приоритет одинаковый, сортируем по дате
        if (a.dueDate != null && b.dueDate != null) {
          return a.dueDate!.compareTo(b.dueDate!);
        } else if (a.dueDate != null) {
          return -1; // Задачи с установленной датой идут перед задачами без даты
        } else if (b.dueDate != null) {
          return 1; // Задачи без даты идут после задач с установленной датой
        }

        return 0; // Если обе задачи не имеют даты, оставляем их в текущем порядке
      });

    return sortedTask;
  }
}
