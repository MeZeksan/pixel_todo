import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.module.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String taskTitle;

  @HiveField(1)
  bool isCompleted;

  @HiveField(2)
  String taskDescription;

  @HiveField(3)
  int priority; // Приоритет задачи (0 - низкий, 1 - средний, 2 - высокий)

  // @HiveField(4)    // пока что в долгий ящик
  // DateTime dueDate;

  //TODO добавить dueDate
  Task(
      {this.taskTitle = '',
      this.isCompleted = false,
      this.taskDescription = '',
      this.priority = 0});
}
