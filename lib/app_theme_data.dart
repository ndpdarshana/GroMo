import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData light() {
    return ThemeData(
      primaryColor: Colors.blue,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
