// app_styles.dart

// Flutter imports:
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle bigTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontFamily: "TeletactileRus",
    fontSize: 20,
  );
  static const TextStyle mediumHintStyle = TextStyle(
    color: Color.fromARGB(255, 78, 78, 78),
    fontFamily: "TeletactileRus",
    fontSize: 18,
  );

  static const TextStyle defaultTextStyle = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontFamily: "TeletactileRus",
    fontSize: 16,
  );
  static const TextStyle completedTextStyle = TextStyle(
    decoration: TextDecoration.lineThrough,
    color: Color.fromARGB(255, 0, 0, 0),
    fontFamily: "TeletactileRus",
    fontSize: 16,
  );
  static const TextStyle bigHintStyle = TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 191, 191, 191),
    fontFamily: "TeletactileRus",
  );
}
