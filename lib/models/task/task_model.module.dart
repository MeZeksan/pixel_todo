import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.module.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String taskTitle;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  String taskDescription;

  @HiveField(4)
  int priority; // Приоритет задачи (0 - низкий, 1 - средний, 2 - высокий)

  @HiveField(5)
  int difficulty;

  @HiveField(6)
  DateTime? dueDate;

  Task({
    required this.id,
    this.taskTitle = '',
    this.isCompleted = false,
    this.taskDescription = '',
    this.priority = 0,
    this.difficulty = 0,
    this.dueDate,
  });

  // Метод copyWith для создания копии с изменёнными параметрами
  Task copyWith({
    String? id,
    String? taskTitle,
    bool? isCompleted,
    String? taskDescription,
    int? priority,
    int? difficulty,
    DateTime? dueDate,
  }) {
    return Task(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      isCompleted: isCompleted ?? this.isCompleted,
      taskDescription: taskDescription ?? this.taskDescription,
      priority: priority ?? this.priority,
      difficulty: difficulty ?? this.difficulty,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  // Переписка оператора == для задач
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
