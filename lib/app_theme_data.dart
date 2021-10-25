import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData light() {
    return ThemeData(
      primaryColor: Colors.blue,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      ),
    );
  }
}
