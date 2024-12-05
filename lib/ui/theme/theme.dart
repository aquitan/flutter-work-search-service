import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 234, 100, 43);
const secondaryColor = Color.fromRGBO(110, 119, 129, 1);
const secondaryFlat = Color.fromRGBO(244, 244, 245, 1);
const tertiaryFlatLight = Color.fromRGBO(246, 248, 250, 1);
const tertiaryColor = Color.fromRGBO(175, 184, 193, 1);
const errorColor = Color.fromRGBO(218, 20, 20, 1);

const layoutBackground = Color.fromRGBO(255, 255, 255, 1);

const primaryColorDark = Color.fromARGB(255, 234, 100, 43);
const secondaryColorDark = Color.fromRGBO(110, 119, 129, 1);
const tertiaryColorDark = Color.fromRGBO(63, 63, 70, 1);
const secondaryFlatDark = Color.fromRGBO(39, 39, 42, 1);
const errorColorDark = Color.fromRGBO(218, 20, 20, 1);

const successColor = Color.fromRGBO(18, 161, 80, 1);
const warningColor = Color.fromRGBO(245, 165, 36, 1);

const primaryFlat = Color.fromRGBO(253, 239, 234, 1);

final darkThemeData = ThemeData(
  textTheme: textThemeDark,
  useMaterial3: true,
  primaryColor: primaryColor,
  tabBarTheme: TabBarTheme(labelColor: const Color.fromARGB(255, 0, 0, 0)),
  dividerColor: const Color.fromRGBO(228, 228, 231, 1),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  cardTheme: CardTheme(
    shadowColor: Color.fromRGBO(255, 255, 255, .2),
    color: Color.fromRGBO(22, 22, 22, 1),
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(22, 22, 22, 1)),
  colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primaryColorDark,
      secondary: secondaryColorDark,
      secondaryFixedDim: secondaryFlatDark,
      tertiary: tertiaryColorDark,
      error: errorColorDark,
      tertiaryContainer: Color.fromARGB(0, 196, 196, 196)),
);

final lightThemeData = ThemeData(
  textTheme: textThemeLight,
  useMaterial3: true,
  primaryColor: primaryColor,
  tabBarTheme: TabBarTheme(labelColor: Colors.grey),
  dividerColor: const Color.fromRGBO(228, 228, 231, 1),

  cardTheme: CardTheme(
    shadowColor: Color.fromRGBO(0, 0, 0, .2),
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Color.fromRGBO(239, 241, 243, 1),
  iconTheme: IconThemeData(color: Color.fromRGBO(39, 39, 42, 1)),
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: primaryColor,
    secondary: secondaryColor,
    secondaryFixedDim: secondaryFlat,
    tertiaryFixedDim: tertiaryFlatLight,
    tertiary: tertiaryColor,
    error: errorColor,
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
