part of 'home_screen.bloc.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  HomeLoadedState(this.tasks);

  final Box<Task> tasks;
}

//TODO передавать на экран с ошибкой
class HomeErrorState extends HomeState {
  HomeErrorState({this.exception});

  final Object? exception;
}
