// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:pixel_todo/models/task/task.dart';

part 'home_screen_event.bloc.dart';
part 'home_screen_state.bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._taskBox) : super(HomeInitialState()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<UpdateTaskEvent>(_onUpdateTask);
  }

  //не сделал через GetIt, чтобы нужно было явно передавать бокс
  final Box<Task> _taskBox;

  //метод для загрузки задач
  void _onLoadTasks(LoadTasksEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState()); // Состояние загрузки
    try {
      final tasks = _taskBox;
      emit(HomeLoadedState(tasks)); // Отправляем список задач в состояние
    } catch (e) {
      emit(HomeErrorState(exception: e)); // Обработка ошибок
    }
  }

  void _onAddTask(AddTaskEvent event, Emitter<HomeState> emit) {
    _taskBox.put(event.task.id, event.task); // Используем put для явного указания ID
    add(LoadTasksEvent()); //после добавления задачи перезагружаем список
  }

  //удаление задачи
  void _onDeleteTask(DeleteTaskEvent event, Emitter<HomeState> emit) {
    _taskBox.delete(event.taskId);
    add(LoadTasksEvent());
  }

  void _onUpdateTask(UpdateTaskEvent event, Emitter<HomeState> emit) {
    try {
      // Обновляем задачу в Hive
      _taskBox.put(event.updatedTask.id, event.updatedTask);

      // После обновления перезагружаем список задач
      add(LoadTasksEvent());
    } catch (e) {
      emit(HomeErrorState(exception: e));
    }
  }
}
