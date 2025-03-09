part of 'home_screen.bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Box<Task>
      activeTask; //изменил боксы с активными и выполненными задачами
  final Box<Task> completeTask;
  final int currentTabIndex; //добавил текущий индекс в Tab
  HomeLoaded(this.activeTask, this.completeTask, this.currentTabIndex);
}

//TODO передавать на экран с ошибкой
class HomeError extends HomeState {
  final Object? exception;

  HomeError({this.exception});
}
