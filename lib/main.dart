import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/home/home.dart';
import 'models/task/task.dart';

const todoBoxName = 'todo_box_name';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); //инициализация Hive

  Hive.registerAdapter(TaskAdapter()); //регистрируем адаптер

  var boxTodo = await Hive.openBox<Task>(todoBoxName);

  //Тестовые задачи
  await boxTodo
      .add(Task(taskTitle: 'Создать собственную задачу', isCompleted: false));
  await boxTodo.add(Task(taskTitle: 'Скачать приложение!', isCompleted: true));

  GetIt.I.registerSingleton<Box<Task>>(boxTodo);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 103, 103, 145);
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 75, 75, 75),
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true),
    );
  }
}
