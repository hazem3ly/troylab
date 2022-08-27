import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    fontFamily: 'SFPRODISPLAY',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.primary,
    ),
  );

  static final ThemeData dark = ThemeData(
    fontFamily: 'SFPRODISPLAY',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark().copyWith(secondary: AppColors.accent),
  );
}
