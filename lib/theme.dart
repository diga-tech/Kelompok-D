import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 47, 255, 0),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 255, 255, 255),
    size: 25,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 36, 36, 36), elevation: 0),
  tabBarTheme: const TabBarTheme(
    labelColor: Color.fromARGB(255, 17, 130, 0),
  ),
);
