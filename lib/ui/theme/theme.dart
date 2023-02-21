import 'package:flutter/material.dart';

class AppTheme {
  static const Color _black = Colors.black;
  static const Color _cyan = Colors.cyan;
  static const Color _white = Colors.white;
  static final Color _red = Colors.red.shade700;
  static final Color _bg = Colors.grey.shade50;

  static ThemeData light = ThemeData(
    primaryColor: Colors.black,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: _black,
        onPrimary: _white,
        secondary: _cyan,
        onSecondary: _white,
        error: _red,
        onError: _white,
        background: _bg,
        onBackground: _black,
        surface: Colors.grey.shade100,
        onSurface: _black,
    )
  );
}