// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/widgets/add_task_dialog.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  void _showCustomDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: BlocProvider.of<HomeBloc>(context), // Передаем существующий BLoC
          child: AddTaskDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showCustomDialog(context); // Вызов метода показа диалога
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Image.asset(
        'assets/images/feather.png',
        width: 56,
        height: 56,
      ),
    );
  }
}
