import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/models/task/task.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  //т.к. id не меняем, то и добавлять его нет смысла
  late String _taskTitle;
  late String _taskDescription;
  late bool _isCompleted;
  late int _priority;
  late int _difficulty;
  DateTime? _dueDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задача'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTask,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: 2,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "TeletactileRus",
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  labelText: 'Название задачи',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "TeletactileRus",
                    fontSize: 14,
                  ),
                ),
                controller: TextEditingController(text: _taskTitle)
                  ..selection =
                      TextSelection.collapsed(offset: _taskTitle.length),
                onChanged: (value) {
                  _taskTitle = value;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "TeletactileRus",
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  labelText: 'Описание задачи',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "TeletactileRus",
                  ),
                ),
                controller: TextEditingController(text: _taskDescription)
                  ..selection =
                      TextSelection.collapsed(offset: _taskDescription.length),
                maxLines: 10,
                onChanged: (value) {
                  _taskDescription = value;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Статус задачи:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "TeletactileRus",
                      fontSize: 14,
                    ),
                  ),
                  Switch(
                    value: _isCompleted,
                    onChanged: (value) {
                      setState(() {
                        _isCompleted = value;
                      });
                    },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPriorityOption(
                      0, 'assets/images/low_priority.png'), // Low priority
                  _buildPriorityOption(1,
                      'assets/images/medium_priority.png'), // medium_priority priority
                  _buildPriorityOption(
                      2, 'assets/images/top_priority.png'), // High priority
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDifficultyOption(
                      0, 'assets/images/easy_difficulty.png'),
                  _buildDifficultyOption(
                      1, 'assets/images/medium_difficulty.png'),
                  _buildDifficultyOption(
                      2, 'assets/images/hard_difficulty.png'),
                  _buildDifficultyOption(
                      3, 'assets/images/insane_difficulty.png'),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _selectDueDate,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.calendar_month),
                    Text(
                      _dueDate == null
                          ? "Выбрать дату"
                          : "Дата: ${_dueDate!.toString().split(' ')[0]}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "TeletactileRus",
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _taskTitle = widget.task.taskTitle;
    _taskDescription = widget.task.taskDescription;
    _isCompleted = widget.task.isCompleted;
    _priority = widget.task.priority;
    _difficulty = widget.task.difficulty;
    _dueDate = widget.task.dueDate;
  }

  void _saveTask() {
    final taskBox = Hive.box<Task>('todo_box_name');
    final updatedTask = Task(
        id: widget.task.id, // Все так же используем тот же айдишник
        taskTitle: _taskTitle,
        isCompleted: _isCompleted,
        taskDescription: _taskDescription,
        priority: _priority,
        difficulty: _difficulty,
        dueDate: _dueDate);
    taskBox.put(widget.task.id, updatedTask);
    Navigator.pop(context);
  }

  Widget _buildPriorityOption(int priorityLevel, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _priority = priorityLevel;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: _priority == priorityLevel
              ? Border.all(color: Colors.blue, width: 3)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(imagePath, width: 50, height: 50),
      ),
    );
  }

  Widget _buildDifficultyOption(int difficultyLevel, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _difficulty = difficultyLevel;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: _difficulty == difficultyLevel
              ? Border.all(color: Colors.blue, width: 3)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(imagePath, width: 50, height: 50),
      ),
    );
  }

  Future<void> _selectDueDate() async {
    final DateTime? pickedDate = await showDatePicker(
        cancelText: 'Отменить',
        confirmText: 'Подтвердить',
        context: context,
        initialDate: _dueDate,
        //добавить удаление даты
        firstDate: DateTime(2025),
        lastDate: DateTime(2052));
    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }
}
