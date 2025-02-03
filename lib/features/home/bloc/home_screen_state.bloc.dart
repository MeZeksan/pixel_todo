part of 'home_screen.bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {}
