part of 'task_detail.bloc.dart';

abstract class TaskDetailState {
  const TaskDetailState();

  // Добавляем геттер task в абстрактный класс
  Task get task;
}

class TaskDetailInitial extends TaskDetailState {
  final Task _task;

  const TaskDetailInitial(this._task);

  @override
  Task get task => _task; // Реализация геттера
}

class TaskDetailUpdated extends TaskDetailState {
  final Task _task;

  const TaskDetailUpdated(this._task);

  @override
  Task get task => _task; // Реализация геттера
}
