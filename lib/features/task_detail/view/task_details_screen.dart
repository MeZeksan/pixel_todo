import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/features/task_detail/bloc/task_detail.bloc.dart';
import 'package:pixel_todo/features/task_detail/service/date_picker.service.dart';
import 'package:pixel_todo/features/task_detail/widgets/widgets.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task initialTask;
  final Box<Task> taskBox;

  const TaskDetailsScreen({
    super.key,
    required this.initialTask,
    required this.taskBox,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailBloc(initialTask, taskBox),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Квест',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "TeletactileRus",
              fontSize: 20,
            ),
          ),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    // Используем context, который находится внутри BlocProvider
                    context.read<TaskDetailBloc>().add(SaveTaskEvent());
                    Navigator.pop(context, true);
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<TaskDetailBloc, TaskDetailState>(
          builder: (context, state) {
            final task = state.task;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: TextEditingController(text: task.taskTitle),
                      onChanged: (value) => context.read<TaskDetailBloc>().add(
                            UpdateTaskTitle(value),
                          ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "TeletactileRus",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "TeletactileRus",
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Описание квеста',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "TeletactileRus",
                        ),
                      ),
                      controller:
                          TextEditingController(text: task.taskDescription),
                      maxLines: 10,
                      onChanged: (value) => context.read<TaskDetailBloc>().add(
                            UpdateTaskDescription(value),
                          ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Статус квеста:',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "TeletactileRus",
                            fontSize: 14,
                          ),
                        ),
                        Switch(
                          value: task.isCompleted,
                          onChanged: (value) =>
                              context.read<TaskDetailBloc>().add(
                                    UpdateTaskStatus(value),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Приоритет:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "TeletactileRus",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PriorityOption(
                          priorityLevel: 0,
                          imagePath: 'assets/images/low_priority.png',
                        ),
                        PriorityOption(
                          priorityLevel: 1,
                          imagePath: 'assets/images/medium_priority.png',
                        ),
                        PriorityOption(
                          priorityLevel: 2,
                          imagePath: 'assets/images/top_priority.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Сложность:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "TeletactileRus",
                        fontSize: 14,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DifficultyOption(
                          difficultyLevel: 0,
                          imagePath: 'assets/images/easy_difficulty.png',
                        ),
                        DifficultyOption(
                          difficultyLevel: 1,
                          imagePath: 'assets/images/medium_difficulty.png',
                        ),
                        DifficultyOption(
                          difficultyLevel: 2,
                          imagePath: 'assets/images/hard_difficulty.png',
                        ),
                        DifficultyOption(
                          difficultyLevel: 3,
                          imagePath: 'assets/images/insane_difficulty.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () =>
                                DatePickerService.selectDueDate(context),
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(59, 107, 118, 127),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(64, 107, 118, 127),
                                  width: 3,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
