part of 'task_detail.bloc.dart';

abstract class TaskDetailState {
  const TaskDetailState();

  // Добавляем геттер task в абстрактный класс
  Task get task;
}

class TaskDetailInitialState extends TaskDetailState {
  final Task _task;

  const TaskDetailInitialState(this._task);

  @override
  Task get task => _task; // Реализация геттера
}

class TaskDetailUpdatedState extends TaskDetailState {
  final Task _task;

  const TaskDetailUpdatedState(this._task);

  @override
  Task get task => _task; // Реализация геттера
}
