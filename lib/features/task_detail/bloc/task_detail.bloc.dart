import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

part 'task_detail_event.bloc.dart';
part 'task_detail_state.bloc.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  //чтобы не было частых обращений через GetIt - передам бокс
  final Task initialTask;
  final Box<Task> taskBox;
  TaskDetailBloc(this._task, this._taskBox) : super(TaskDetailInitial(task)){
    //регистрация обработчиков событий
    on<UpdateTaskTitle> (_onUpdateTaskTitle);
    on<UpdateTaskDescription>(_onUpdateTaskDescription);
    on<UpdateTaskStatus>(_onUpdateTaskStatus);
    on<UpdateTaskPriority>(_onUpdateTaskPriority);
    on<UpdateTaskDifficulty>(_onUpdateTaskDifficulty);
    on<UpdateTaskDueDate>(onUpdateTaskDueDate);
    on<SaveTaskEvent>(_onSaveTask);


  };
}
