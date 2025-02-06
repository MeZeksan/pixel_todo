part of 'task_detail.bloc.dart';

abstract class TaskDetailEvent {}

class UpdateTaskTitle extends TaskDetailEvent {
  final String taskTitle;
  UpdateTaskTitle(this.taskTitle);
}

class UpdateTaskDescription extends TaskDetailEvent {
  final String taskDescription;
  UpdateTaskDescription(this.taskDescription);
}

class UpdateTaskStatus extends TaskDetailEvent {
  final bool isChecked;
  UpdateTaskStatus(this.isChecked);
}

class UpdateTaskPriority extends TaskDetailEvent {
  final int priority;
  UpdateTaskPriority(this.priority);
}

class UpdateTaskDifficulty extends TaskDetailEvent {
  final int difficulty;
  UpdateTaskDifficulty(this.difficulty);
}

class UpdateTaskDueDate extends TaskDetailEvent {
  final DateTime? dueDate;
  UpdateTaskDueDate(this.dueDate);
}

class SaveTaskEvent extends TaskDetailEvent {}
