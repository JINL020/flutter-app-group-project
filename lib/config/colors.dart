import 'package:flutter/material.dart';

class AppColors {
  static Color backgroundRed = Color(0xFFA71C49);
  static Color backgroundBlue = Color(0xFF0063A6);
  static Color statusBoxWhite = Colors.white.withOpacity(0.5);
  static Color textFieldWhite = Colors.white.withOpacity(0.97);
  static Color textBoxWhite = Colors.white.withOpacity(0.85);

  static Widget backgroundGradient = Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black.withOpacity(0.25),
          Colors.white.withOpacity(0.2),
        ],
        stops: [0.5, 1],
        begin: FractionalOffset(0.5, 0.2),
        end: FractionalOffset(0.6, 0.9),
      ),
    ),
  );
}
