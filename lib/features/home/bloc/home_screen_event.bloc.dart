part of 'home_screen.bloc.dart';

abstract class HomeEvent {}

class LoadTasks extends HomeEvent {}

class AddTask extends HomeEvent {
  final Task task;

  AddTask(this.task);
}

class DeleteTask extends HomeEvent {
  final String taskId;

  DeleteTask(this.taskId);
}

class UpdateTask extends HomeEvent {} // к Firebase

class SyncTasks extends HomeEvent {} // к Firebase
