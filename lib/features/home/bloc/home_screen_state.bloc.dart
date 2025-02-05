part of 'home_screen.bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Task> tasks;

  HomeLoaded(this.tasks);
}

//TODO передавать на экран с ошибкой
class HomeError extends HomeState {
  final Object? exception;

  HomeError({this.exception});
}
