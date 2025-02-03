import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });
  void _showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const AddTaskButton();
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
