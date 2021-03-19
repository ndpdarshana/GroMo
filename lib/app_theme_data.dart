import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData light() {
    return ThemeData(
      primaryColor: Colors.blue,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
    );
  }
}
