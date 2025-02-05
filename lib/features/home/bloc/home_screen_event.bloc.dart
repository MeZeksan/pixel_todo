part of 'home_screen.bloc.dart';

abstract class HomeEvent {}

class LoadTasks extends HomeEvent {}

class AddTask extends HomeEvent {
  final Task task;

  AddTask(this.task);
}

class DeleteTask extends HomeEvent {
  final String taskId;

  DeleteTask({required this.taskId});
}

class UpdateTask extends HomeEvent {
  final Task updatedTask; // Передаем обновленную задачу
  UpdateTask(this.updatedTask);
}

class SyncTasks extends HomeEvent {} // к Firebase
