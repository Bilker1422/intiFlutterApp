import 'package:flutter/material.dart';

var primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  textTheme: const TextTheme(
    //https://api.flutter.dev/flutter/material/TextTheme-class.html
    titleLarge: TextStyle(),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
