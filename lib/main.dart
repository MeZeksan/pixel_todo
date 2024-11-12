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
    const primaryColor = Color.fromARGB(255, 166, 255, 82);
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 236, 236, 236),
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true),
    );
  }
}
