import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 234, 100, 43);

final darkThemeData = ThemeData(
  textTheme: textThemeDark,
  useMaterial3: true,
  primaryColor: primaryColor,
  tabBarTheme: TabBarTheme(labelColor: const Color.fromARGB(255, 0, 0, 0)),
  cardTheme: CardTheme(
    shadowColor: Color.fromRGBO(255, 255, 255, .2),
    color: Color.fromRGBO(22, 22, 22, 1),
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(22, 22, 22, 1)),
  colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primaryColor,
      tertiaryContainer: Color.fromARGB(0, 196, 196, 196)),
);

final lightThemeData = ThemeData(
  textTheme: textThemeLight,
  useMaterial3: true,
  primaryColor: primaryColor,
  tabBarTheme: TabBarTheme(labelColor: Colors.grey),
  cardTheme: CardTheme(
    shadowColor: Color.fromRGBO(0, 0, 0, .2),
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: primaryColor,
    tertiaryContainer: Color(0xFFF1F1F1),
  ),
);

final textThemeLight = TextTheme(
  titleLarge: TextStyle(
      fontFamily: 'Jost',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.black),
  titleMedium: TextStyle(
      fontFamily: 'Jost',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black),
  bodyLarge: TextStyle(
      fontFamily: 'Jost',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black),
  bodyMedium: TextStyle(
      fontFamily: 'Jost',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black),
  bodySmall: TextStyle(
      fontFamily: 'Jost',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black),
);

final textThemeDark = TextTheme(
  titleLarge: TextStyle(
      fontFamily: 'Jost',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white),
  titleMedium: TextStyle(
      fontFamily: 'Jost',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white),
  bodyLarge: TextStyle(
      fontFamily: 'Jost',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white),
  bodyMedium: TextStyle(
      fontFamily: 'Jost',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white),
  bodySmall: TextStyle(
      fontFamily: 'Jost',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white),
);
