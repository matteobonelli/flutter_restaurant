import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade50,
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade200,
    primaryContainer: Colors.blue.shade600,
    tertiary: Colors.black,
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.white70,
    secondary: Colors.grey.shade100,
    primaryContainer: Colors.black,
  )
);