import 'package:flutter/material.dart';

class AppTheme {
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static final Color _red = Colors.red.shade700;
  static final Color brown = Colors.brown.shade400;
  static final _bgLight = Colors.grey.shade50;
  static const Color _grey = Colors.grey;

  static ThemeData light = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _black,
      onPrimary: _white,
      secondary: brown,
      onSecondary: _white,
      error: _red,
      onError: _white,
      background: _bgLight,
      onBackground: _black,
      surface: _grey,
      onSurface: _black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: _black,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
