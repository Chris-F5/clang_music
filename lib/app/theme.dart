import 'package:flutter/material.dart';

ThemeData buildLightTheme() => _buildTheme(Brightness.light);

ThemeData buildDarkTheme() => _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff49606f),
    brightness: brightness,
  );

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    appBarTheme: const AppBarTheme(centerTitle: false),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      isDense: true,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 0,
    ),
  );
}
