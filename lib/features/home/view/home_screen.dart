import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
import 'package:pixel_todo/models/task/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => HomeBloc(GetIt.I<Box<Task>>())..add(LoadTasks()),
      child: Scaffold(
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
      ),
    );
  }
}
