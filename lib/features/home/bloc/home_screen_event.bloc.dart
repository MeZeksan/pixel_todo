part of 'home_screen.bloc.dart';

sealed class HomeEvent {}

class LoadTasksEvent extends HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final Task task;

  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends HomeEvent {
  final String taskId;

  DeleteTaskEvent({required this.taskId});
}

class UpdateTaskEvent extends HomeEvent {
  final Task updatedTask; // Передаем обновленную задачу
  UpdateTaskEvent(this.updatedTask);
}

class SyncTasksEvent extends HomeEvent {} // к Firebase
