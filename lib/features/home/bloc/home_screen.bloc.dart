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
    emit(HomeLoading()); // Состояние загрузки
    try {
      final tasks = _taskBox.values.toList(); // Получаем список задач
      print('Загружены задачи: $tasks'); // Логирование для отладки
      emit(HomeLoaded(tasks)); // Отправляем список задач в состояние
    } catch (e) {
      print('Ошибка при загрузке задач: $e'); // Логирование ошибки
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
}
