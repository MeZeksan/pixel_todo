part of 'task_detail.bloc.dart';

abstract class TaskDetailState {}

class TaskDetailInitial extends TaskDetailState {
  final Task task;
  TaskDetailInitial(this.task);
}

class TaskDetailUpdate extends TaskDetailState {
  final Task updatedTask;
  final Task taskBox;
  TaskDetailUpdate(this.updatedTask, this.taskBox);
}
