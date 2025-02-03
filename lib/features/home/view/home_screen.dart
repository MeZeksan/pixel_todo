import 'package:flutter/material.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showCustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                  height: double.maxFinite,
                  color: theme.primaryColor,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/stub_hero.png',
                    fit: BoxFit.fill,
                  )),
            ),
            // Добавляем фон в области задач
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topLeft,
                      image: AssetImage(
                          'assets/images/wooden_background_desk.png'),
                      fit: BoxFit.contain,
                      repeat: ImageRepeat.repeat, // Повторение фона
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 211, 183, 122),
                          BlendMode.overlay)),
                ),
                child: const CustomScrollView(
                  slivers: [TasksList()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
