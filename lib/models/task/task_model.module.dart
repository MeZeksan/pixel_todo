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

  //TODO добавить , isCompletem priority, dueDate
  Task({
    this.taskTitle = '',
    this.isCompleted = false,
    this.taskDescription = '',
  });
}
