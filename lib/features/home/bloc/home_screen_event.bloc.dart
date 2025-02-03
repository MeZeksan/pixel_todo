part of 'home_screen.bloc.dart';

abstract class HomeEvent {}

class LoadTasks extends HomeEvent {}

class AddTask extends HomeEvent {}

class DeleteTask extends HomeEvent {}

class UpdateTasks extends HomeEvent {} // к Firebase

class SyncTasks extends HomeEvent {} // к Firebase
