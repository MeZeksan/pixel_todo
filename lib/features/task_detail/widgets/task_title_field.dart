import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskTitleField extends StatefulWidget {
  const TaskTitleField({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  _TaskTitleFieldState createState() => _TaskTitleFieldState();
}

class _TaskTitleFieldState extends State<TaskTitleField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.taskTitle);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) => context.read<TaskDetailBloc>().add(
            UpdateTaskTitle(value),
          ),
      style: AppStyles.defaultTextStyle,
    );
  }
}
