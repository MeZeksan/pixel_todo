import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/features/task_detail/service/service.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskChooseDateWidget extends StatelessWidget {
  const TaskChooseDateWidget({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: GestureDetector(
            onTap: () => DatePickerService.selectDueDate(context),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(59, 107, 118, 127),
                border: Border.all(
                  color: const Color.fromARGB(64, 107, 118, 127),
                  width: 3,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    task.dueDate == null
                        ? "Выбрать дату"
                        : "Дата: ${task.dueDate!.toString().split(' ')[0]}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "TeletactileRus",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () => context.read<TaskDetailBloc>().add(
                  UpdateTaskDueDate(null),
                ),
            icon: Image.asset(
              'assets/images/delete_task.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
