import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/core/constants/constants.dart';
import 'package:pixel_todo/models/task/task.dart';

part 'task_detail_event.bloc.dart';
part 'task_detail_state.bloc.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  final Task initialTask; // Начальная задача, которая передается в BLoC

  // Получаем боксы через GetIt
  final Box<Task> _taskBox = GetIt.I<Box<Task>>(instanceName: todoBoxName);
  final Box<Task> _completedBox =
      GetIt.I<Box<Task>>(instanceName: completedBoxName);

  // Конструктор BLoC
  TaskDetailBloc(this.initialTask) : super(TaskDetailInitial(initialTask)) {
    // Регистрируем обработчики событий
    on<UpdateTaskTitle>(_onUpdateTaskTitle);
    on<UpdateTaskDescription>(_onUpdateTaskDescription);
    on<UpdateTaskStatus>(_onUpdateTaskStatus);
    on<UpdateTaskPriority>(_onUpdateTaskPriority);
    on<UpdateTaskDifficulty>(_onUpdateTaskDifficulty);
    on<UpdateTaskDueDate>(_onUpdateTaskDueDate);
    on<SaveTaskEvent>(_onSaveTask);
  }
  // Вспомогательный метод для получения текущей задачи из состояния
  Task _currentTask(TaskDetailState state) {
    return state.task; // Используем геттер task из состояния
  }

  // Обработчик события обновления названия задачи
  void _onUpdateTaskTitle(
      UpdateTaskTitle event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);
    // Создаем копию задачи с новым названием и эмитим новое состояние
    emit(TaskDetailUpdated(currentTask.copyWith(taskTitle: event.taskTitle)));
  }

  // Обработчик события обновления описания задачи
  void _onUpdateTaskDescription(
      UpdateTaskDescription event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);
    // Создаем копию задачи с новым описанием и эмитим новое состояние
    emit(TaskDetailUpdated(
        currentTask.copyWith(taskDescription: event.taskDescription)));
  }

  // Обработчик события обновления статуса задачи (выполнена/не выполнена)
  void _onUpdateTaskStatus(
      UpdateTaskStatus event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);
    // Создаем копию задачи с новым статусом и эмитим новое состояние
    emit(TaskDetailUpdated(currentTask.copyWith(isCompleted: event.isChecked)));
  }

  // Обработчик события обновления приоритета задачи
  void _onUpdateTaskPriority(
      UpdateTaskPriority event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);
    // Создаем копию задачи с новым приоритетом и эмитим новое состояние
    emit(TaskDetailUpdated(currentTask.copyWith(priority: event.priority)));
  }

  // Обработчик события обновления сложности задачи
  void _onUpdateTaskDifficulty(
      UpdateTaskDifficulty event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);
    // Создаем копию задачи с новой сложностью и эмитим новое состояние
    emit(TaskDetailUpdated(currentTask.copyWith(difficulty: event.difficulty)));
  }

  // Обработчик события обновления даты выполнения задачи
  void _onUpdateTaskDueDate(
      UpdateTaskDueDate event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);
    // Создаем копию задачи с новой датой выполнения и эмитим новое состояние
    emit(TaskDetailUpdated(currentTask.copyWith(dueDate: event.dueDate)));
  }

  // Обработчик события сохранения задачи
  void _onSaveTask(SaveTaskEvent event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask(state);

    // Определяем целевой бокс в зависимости от статуса
    final targetBox = currentTask.isCompleted ? _completedBox : _taskBox;
    final sourceBox = currentTask.isCompleted ? _taskBox : _completedBox;

    // Удаляем из исходного бокса и добавляем в целевой
    sourceBox.delete(currentTask.id);
    targetBox.put(currentTask.id, currentTask);

    emit(TaskDetailInitial(currentTask));
  }
}
