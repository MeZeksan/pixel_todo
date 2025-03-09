import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

part 'home_screen_event.bloc.dart';
part 'home_screen_state.bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //не сделал через GetIt, чтобы нужно было явно передавать бокс
  final Box<Task> _taskBox;
  final Box<Task> _completedBox;

  HomeBloc(this._taskBox, this._completedBox) : super(HomeInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  //метод для загрузки задач
  void _onLoadTasks(LoadTasks event, Emitter<HomeState> emit) async {
    emit(HomeLoading()); // Состояние загрузки
    try {
      emit(HomeLoaded(
          _taskBox, _completedBox, 0)); // Отправляем список задач в состояние
    } catch (e) {
      emit(HomeError(exception: e)); // Обработка ошибок
    }
  }

  void _onAddTask(AddTask event, Emitter<HomeState> emit) {
    _taskBox.put(
        event.task.id, event.task); // Используем put для явного указания ID
    add(LoadTasks()); //после добавления задачи перезагружаем список
  }

  //удаление задачи
  void _onDeleteTask(DeleteTask event, Emitter<HomeState> emit) {
    final task = event.task;
    if (task.isCompleted) {
      _completedBox.delete(task.id);
    } else {
      _taskBox.delete(task.id);
    }
    add(LoadTasks());
  }

  void _onUpdateTask(UpdateTask event, Emitter<HomeState> emit) {
    try {
      final task = event.updatedTask;

      if (task.isCompleted) {
        _taskBox.delete(task.id);
        _completedBox.put(task.id, task);
      } else {
        _completedBox.delete(task.id);
        _taskBox.put(task.id, task);
      }

      add(LoadTasks());
    } catch (e) {
      emit(HomeError(exception: e));
    }
  }
}
