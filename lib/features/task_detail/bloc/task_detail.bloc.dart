import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/core/constants/constants.dart';
import 'package:pixel_todo/models/task/task.dart';

part 'task_detail_event.bloc.dart';
part 'task_detail_state.bloc.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  final Task initialTask;

  // Получаем боксы через GetIt
  final Box<Task> _taskBox = GetIt.I<Box<Task>>(instanceName: todoBoxName);
  final Box<Task> _completedBox =
      GetIt.I<Box<Task>>(instanceName: completedBoxName);

  TaskDetailBloc(this.initialTask) : super(TaskDetailInitial(initialTask)) {
    on<UpdateTaskTitle>(_onUpdateTaskTitle);
    on<UpdateTaskDescription>(_onUpdateTaskDescription);
    on<UpdateTaskStatus>(_onUpdateTaskStatus);
    on<UpdateTaskPriority>(_onUpdateTaskPriority);
    on<UpdateTaskDifficulty>(_onUpdateTaskDifficulty);
    on<UpdateTaskDueDate>(_onUpdateTaskDueDate);
    on<SaveTaskEvent>(_onSaveTask);
  }

  // Геттер для текущей задачи
  Task get _currentTask => state.task;

  void _onUpdateTaskTitle(
      UpdateTaskTitle event, Emitter<TaskDetailState> emit) {
    // Каждый раз мы создаем копию задачи с новым приоритетом и эмитим новое состояние
    emit(TaskDetailUpdated(_currentTask.copyWith(taskTitle: event.taskTitle)));
  }

  void _onUpdateTaskDescription(
      UpdateTaskDescription event, Emitter<TaskDetailState> emit) {
    emit(TaskDetailUpdated(
        _currentTask.copyWith(taskDescription: event.taskDescription)));
  }

  void _onUpdateTaskStatus(
      UpdateTaskStatus event, Emitter<TaskDetailState> emit) {
    emit(
        TaskDetailUpdated(_currentTask.copyWith(isCompleted: event.isChecked)));
  }

  void _onUpdateTaskPriority(
      UpdateTaskPriority event, Emitter<TaskDetailState> emit) {
    emit(TaskDetailUpdated(_currentTask.copyWith(priority: event.priority)));
  }

  void _onUpdateTaskDifficulty(
      UpdateTaskDifficulty event, Emitter<TaskDetailState> emit) {
    emit(
        TaskDetailUpdated(_currentTask.copyWith(difficulty: event.difficulty)));
  }

  void _onUpdateTaskDueDate(
      UpdateTaskDueDate event, Emitter<TaskDetailState> emit) {
    emit(TaskDetailUpdated(_currentTask.copyWith(dueDate: event.dueDate)));
  }

  void _onSaveTask(SaveTaskEvent event, Emitter<TaskDetailState> emit) {
    final currentTask = _currentTask;

    // Определяем целевой и исходный боксы
    final targetBox = currentTask.isCompleted ? _completedBox : _taskBox;
    final sourceBox = currentTask.isCompleted ? _taskBox : _completedBox;

    sourceBox.delete(currentTask.id);
    targetBox.put(currentTask.id, currentTask);
    emit(TaskDetailInitial(currentTask));
  }
}
