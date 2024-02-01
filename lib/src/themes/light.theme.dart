import 'package:flutter/material.dart';

const Color iconAndTextColor = Colors.white;
const Color backgroundColor = Colors.white;
const Color primaryColor = Color.fromARGB(255, 245, 245, 245);
const Color buttonColor = Color.fromARGB(255, 158, 158, 158);
const Color cardColor = Color.fromARGB(255, 250, 250, 250);
const Color shadowColor = Color.fromARGB(255, 224, 224, 224);
const Color appBarColor = Color.fromARGB(255, 245, 245, 245);
const Color dialogColor = Color.fromARGB(255, 245, 245, 245);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(buttonColor),
    foregroundColor: MaterialStateProperty.all(iconAndTextColor),
    iconColor: MaterialStateProperty.all(iconAndTextColor),
  )),
  scaffoldBackgroundColor: backgroundColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.black),
    displayMedium: TextStyle(color: Colors.black),
    displaySmall: TextStyle(color: Colors.black),
    headlineLarge: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black),
    headlineSmall: TextStyle(color: Colors.black),
    titleLarge: TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Colors.black),
    titleSmall: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
    bodySmall: TextStyle(color: Colors.black),
    labelLarge: TextStyle(color: Colors.black),
    labelMedium: TextStyle(color: Colors.black),
    labelSmall: TextStyle(color: Colors.black),
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
