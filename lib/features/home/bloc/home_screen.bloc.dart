import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

part 'home_screen_event.bloc.dart';
part 'home_screen_state.bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //не сделал через GetIt, чтобы нужно было явно передавать бокс
  final Box<Task> _taskBox;

  HomeBloc(this._taskBox) : super(HomeInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  //метод для загрузки задач
  void _onLoadTasks(LoadTasks event, Emitter<HomeState> emit) async {
    emit(HomeLoading()); // Состояние загрузки
    try {
      final tasks = _taskBox;
      emit(HomeLoaded(tasks)); // Отправляем список задач в состояние
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
    _taskBox.delete(event.taskId);
    add(LoadTasks());
  }

  void _onUpdateTask(UpdateTask event, Emitter<HomeState> emit) {
    try {
      // Обновляем задачу в Hive
      _taskBox.put(event.updatedTask.id, event.updatedTask);

      // После обновления перезагружаем список задач
      add(LoadTasks());
    } catch (e) {
      emit(HomeError(exception: e));
    }
  }
}
