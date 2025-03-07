import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.red,
        onPrimary: Colors.amber,
        secondary: Colors.amber,
        onSecondary: Colors.amber,
        error: Colors.amber,
        onError: Colors.amber,
        surface: Colors.black,
        onSurface: Colors.amber,
      ),
    );
    return theme;
  }

  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.grey,
        onPrimary: Colors.amber,
        secondary: Colors.amber,
        onSecondary: Colors.amber,
        error: Colors.amber,
        onError: Colors.amber,
        surface: Colors.black,
        onSurface: Colors.amber,
      ),
    );
    return theme;
  }

  static ThemeData cyberTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFFFA6FF),
        onPrimary: Color(0xFFB8EFFF),
        secondary: Color(0xFFFFD3B6),
        onSecondary: Color(0xFFFFF6A3),
        error: Color(0xFFFFB6B6),
        onError: Color(0xFF2E2E2E),
        surface: Color(0xFF1E1E2E),
        onSurface: Color(0xFFAAFFC3),
      ),
    );
  }
}
