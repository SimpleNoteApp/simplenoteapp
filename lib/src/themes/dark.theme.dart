import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 43, 41, 41);
const Color secondaryColor = Color.fromARGB(255, 34, 32, 32);
const Color backgroundColor = Color.fromARGB(255, 48, 47, 47);
const Color cardColor = Color.fromARGB(255, 28, 28, 28);
const Color shadowColor = Color.fromARGB(255, 66, 66, 66);
const Color appBarColor = Color.fromARGB(255, 43, 43, 43);
const Color dialogColor = Color.fromARGB(255, 43, 41, 41);
const Color iconAndTextColor = Colors.white;

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(secondaryColor),
    foregroundColor: MaterialStateProperty.all(iconAndTextColor),
    iconColor: MaterialStateProperty.all(iconAndTextColor),
  )),
  iconTheme: const IconThemeData(color: iconAndTextColor),
  scaffoldBackgroundColor: backgroundColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: iconAndTextColor),
    displayMedium: TextStyle(color: iconAndTextColor),
    displaySmall: TextStyle(color: iconAndTextColor),
    headlineLarge: TextStyle(color: iconAndTextColor),
    headlineMedium: TextStyle(color: iconAndTextColor),
    headlineSmall: TextStyle(color: iconAndTextColor),
    titleLarge: TextStyle(color: iconAndTextColor),
    titleMedium: TextStyle(color: iconAndTextColor),
    titleSmall: TextStyle(color: iconAndTextColor),
    bodyLarge: TextStyle(color: iconAndTextColor),
    bodyMedium: TextStyle(color: iconAndTextColor),
    bodySmall: TextStyle(color: iconAndTextColor),
    labelLarge: TextStyle(color: iconAndTextColor),
    labelMedium: TextStyle(color: iconAndTextColor),
    labelSmall: TextStyle(color: iconAndTextColor),
  ),
  cardTheme: CardTheme(
    color: cardColor,
    shadowColor: shadowColor,
    margin: const EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 5.0,
  ),
  appBarTheme: const AppBarTheme(
    color: appBarColor,
    elevation: 0,
  ),
  dialogBackgroundColor: dialogColor,
);
