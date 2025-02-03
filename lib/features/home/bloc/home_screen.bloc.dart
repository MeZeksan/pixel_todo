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
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
  }

  //метод для загрузки задач
  void _onLoadTasks(LoadTasks event, Emitter<HomeState> emit) async {
    emit(HomeLoading()); //состояние загрузки, индикатор круговой пусть буде

    try {
      final tasks = _taskBox.values.toList();
      emit(HomeLoaded(tasks));
    } catch (e) {
      emit(HomeError(exception: e));
    }
  }

  void _onAddTask(AddTask event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      _taskBox.add(event.task);
      add(LoadTasks()); //после добавления задачи перезагружаем список
    }
  }

  //удаление задачи
  void _onDeleteTask(DeleteTask event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      _taskBox.delete(event.taskId);
      add(LoadTasks());
    }
  }
}
