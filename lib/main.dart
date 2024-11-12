import 'package:flutter/material.dart';

import 'features/home/home.dart';

void main() {
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
    const primaryColor = Color.fromARGB(255, 176, 255, 183);
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 145, 118, 92),
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true),
    );
  }
}
