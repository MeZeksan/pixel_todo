import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDescriptionField extends StatefulWidget {
  const TaskDescriptionField({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  _TaskDescriptionFieldState createState() => _TaskDescriptionFieldState();
}

class _TaskDescriptionFieldState extends State<TaskDescriptionField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.taskDescription);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.defaultTextStyle,
      decoration: const InputDecoration(
        labelText: 'Описание квеста',
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: "TeletactileRus",
        ),
      ),
      controller: _controller,
      maxLines: 10,
      onChanged: (value) => context.read<TaskDetailBloc>().add(
            UpdateTaskDescription(value),
          ),
    );
  }
}
