import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0x00006f54),
    contrastLevel: 0.5,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
);

final ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0x00006f54),
    contrastLevel: 0.5,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
);
