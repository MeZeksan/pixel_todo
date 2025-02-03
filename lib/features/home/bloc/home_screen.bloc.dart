import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

part 'home_screen_event.bloc.dart';
part 'home_screen_state.bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //не сделал через GetIt, чтобы нужно было явно передавать бокс
  final Box<Task> _taskBox;

  HomeBloc(this._taskBox) : super(HomeInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTasks);
    on<DeleteTask>(_onDeleteTasks);
  }
}
