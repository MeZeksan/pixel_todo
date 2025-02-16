import 'package:flutter/material.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField({
    super.key,
    required this.taskController,
  });

  final TextEditingController taskController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.defaultTextStyle,
      maxLines: 2,
      controller: taskController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightGreen,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 2.0,
          ),
        ),
        labelText: 'Введите задачу',
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: "TeletactileRus",
        ),
      ),
    );
  }
}
