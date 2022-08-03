import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
   primarySwatch:  const MaterialColor(
          0xFF7F3DFF,
          <int, Color>{
            50: Color(0xFF7F3DFF),
            100: Color(0xFF7F3DFF),
            200: Color(0xFF7F3DFF),
            300: Color(0xFF7F3DFF),
            400: Color(0xFF7F3DFF),
            500: Color(0xFF7F3DFF),
            600: Color(0xFF7F3DFF),
            700: Color(0xFF7F3DFF),
            800: Color(0xFF7F3DFF),
            900: Color(0xFF7F3DFF),
          },
        ),
   fontFamily: "Roboto",
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData lightTheme = ThemeData(
   primarySwatch:  const MaterialColor(
          0xFF7F3DFF,
          <int, Color>{
            50: Color(0xFF7F3DFF),
            100: Color(0xFF7F3DFF),
            200: Color(0xFF7F3DFF),
            300: Color(0xFF7F3DFF),
            400: Color(0xFF7F3DFF),
            500: Color(0xFF7F3DFF),
            600: Color(0xFF7F3DFF),
            700: Color(0xFF7F3DFF),
            800: Color(0xFF7F3DFF),
            900: Color(0xFF7F3DFF),
          },
        ),
   fontFamily: "Roboto",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));