import 'package:flutter/material.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: const AddTaskButton(),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              // TODO убрать заглушку с верхним фоном
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
            const Expanded(
              flex: 4,
              child: BackgroundWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
