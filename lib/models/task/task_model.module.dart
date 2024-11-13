import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.module.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String taskTitle;

  @HiveField(1)
  bool isCompleted;
  //TODO добавить description, isCompletem priority, dueDate
  Task({
    this.taskTitle = '',
    this.isCompleted = false,
  });
}
