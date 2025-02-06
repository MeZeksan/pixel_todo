import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
import 'package:pixel_todo/models/task/task.dart';

class ShowDeleteDialogService {
  static void showDeleteDialog(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value:
              BlocProvider.of<HomeBloc>(context), // Передаем существующий BLoC
          child: DeleteTaskDialog(task: task), // Передаем задачу
        );
      },
    );
  }
}
