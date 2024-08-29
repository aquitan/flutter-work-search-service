import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 234, 100, 43);

final darkThemeData = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
      primary: primaryColor),
);

final lightThemeData = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
      primary: primaryColor),
);

final textTheme = TextTheme(
  titleLarge:
    TextStyle(fontFamily: 'Jost', fontSize: 24, fontWeight: FontWeight.w500),
  titleMedium:
    TextStyle(fontFamily: 'Jost', fontSize: 18, fontWeight: FontWeight.w500),
  bodyLarge:
    TextStyle(fontFamily: 'Jost', fontSize: 18, fontWeight: FontWeight.w400),
  bodyMedium:
    TextStyle(fontFamily: 'Jost', fontSize: 16, fontWeight: FontWeight.w400),
  bodySmall:
    TextStyle(fontFamily: 'Jost', fontSize: 14, fontWeight: FontWeight.normal),
);
