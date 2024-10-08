import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blueAccent,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6200EE),
    secondary: Color(0xFF03DAC5),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepOrange,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  colorScheme: const ColorScheme.dark(
    primary: Colors.grey,
    secondary: Colors.amber,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
);
