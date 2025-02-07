import 'package:flutter/material.dart';

class AppColors {
  // Цветовая палитра для уровней сложности
  static const Map<int, Color> difficultyColors = {
    0: Color.fromARGB(105, 249, 255, 221), // Easy
    1: Color.fromARGB(105, 221, 255, 225), // Medium
    2: Color.fromARGB(105, 255, 221, 221), // Hard
    3: Color.fromARGB(105, 226, 197, 255), // Insane
  };
}
