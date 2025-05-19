import 'package:flutter/material.dart';

final appLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 106, 37),
);

final appDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 2, 54, 19),
  brightness: Brightness.dark,
);

final appLightTheme = ThemeData(
  colorScheme: appLightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: appLightColorScheme.onPrimaryContainer,
    foregroundColor: appLightColorScheme.primaryContainer,
  ),
);

final appDarkTheme = ThemeData.dark().copyWith(
  colorScheme: appDarkColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: appLightColorScheme.onPrimaryContainer,
    foregroundColor: appLightColorScheme.primaryContainer,
  ),
);
