import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get ligthTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Helvetica',
        primaryColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        disabledColor: Colors.grey,
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.blue),
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.black),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Helvetica',
        primaryColor: Colors.blueAccent.shade400,
        backgroundColor: Colors.grey.shade800,
        disabledColor: Colors.grey.shade900,
        textTheme: TextTheme(
          headline6: const TextStyle(color: Colors.white),
          bodyText2: const TextStyle(color: Colors.white70),
          bodyText1: TextStyle(color: Colors.blue.shade300),
          subtitle1: const TextStyle(color: Colors.white),
          subtitle2: const TextStyle(color: Colors.white),
        ),
      );
}
