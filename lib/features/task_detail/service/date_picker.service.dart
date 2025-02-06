import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';

class DatePickerService {
  static Future<void> selectDueDate(BuildContext context) async {
    final currentTask = context.read<TaskDetailBloc>().state.task;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentTask.dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2052),
      cancelText: 'Отменить',
      confirmText: 'Подтвердить',
    );

    if (pickedDate != null) {
      context.read<TaskDetailBloc>().add(UpdateTaskDueDate(pickedDate));
    }
  }
}
