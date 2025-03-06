import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_todo/firebase_options.dart';

import 'features/home/home.dart';
import 'models/task/task.dart';

const todoBoxName = 'todo_box_name';
const completedBoxName = 'completed_box_name';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter(); //инициализация Hive

  Hive.registerAdapter(TaskAdapter()); //регистрируем адаптер

  var boxTodo = await Hive.openBox<Task>(todoBoxName);
  var boxCompleted = await Hive.openBox<Task>(completedBoxName);

  GetIt.I.registerSingleton(todoBoxName, instanceName: todoBoxName);
  GetIt.I.registerSingleton(completedBoxName, instanceName: completedBoxName);

  GetIt.I.registerSingleton<Box<Task>>(boxTodo, instanceName: todoBoxName);
  GetIt.I.registerSingleton<Box<Task>>(boxCompleted,
      instanceName: completedBoxName);
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
          scaffoldBackgroundColor: const Color.fromARGB(255, 172, 172, 182),
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true),
    );
  }
}
