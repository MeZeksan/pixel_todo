part of 'task_detail.bloc.dart';

sealed class TaskDetailEvent {}

class UpdateTaskTitleEvent extends TaskDetailEvent {
  final String taskTitle;
  UpdateTaskTitleEvent(this.taskTitle);
}

class UpdateTaskDescriptionEvent extends TaskDetailEvent {
  final String taskDescription;
  UpdateTaskDescriptionEvent(this.taskDescription);
}

class UpdateTaskStatusEvent extends TaskDetailEvent {
  final bool isChecked;
  UpdateTaskStatusEvent(this.isChecked);
}

class UpdateTaskPriorityEvent extends TaskDetailEvent {
  final int priority;
  UpdateTaskPriorityEvent(this.priority);
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
