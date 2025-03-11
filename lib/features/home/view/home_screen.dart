import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/core/constants/constants.dart';
import 'package:pixel_todo/features/home/bloc/home_screen.bloc.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';
import 'package:pixel_todo/models/task/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => HomeBloc(
        GetIt.I<Box<Task>>(instanceName: GetIt.I(instanceName: todoBoxName)),
        GetIt.I<Box<Task>>(
            instanceName: GetIt.I(instanceName: completedBoxName)),
      )..add(LoadTasks()),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: const AddTaskButton(),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                // Область с картинкой и TabBar
                Flexible(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: double.infinity,
                        color: theme.primaryColor,
                        child: Image.asset(
                          'assets/images/stub_hero.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // TabBar с шириной 50% экрана
                      Container(
                        width: screenWidth * 0.35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/rock.png'),
                          ),
                        ),
                        child: const isCompleteTabBar(),
                      ),
                    ],
                  ),
                ),
                // Область с TabBarView
                const Expanded(
                  flex: 3,
                  child: TabBarView(
                    children: [
                      BackgroundWidget(isActive: true),
                      BackgroundWidget(isActive: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
