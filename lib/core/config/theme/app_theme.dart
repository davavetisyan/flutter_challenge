import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get standart {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'NormsPro',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondary,
        surface: AppColors.background,
        surfaceDim: AppColors.foreground,
        primary: AppColors.primary,
      ),
    );
  }

  static ThemeData get dartkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'NormsPro',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondaryDark,
        surface: AppColors.backgroundDark,
        surfaceDim: AppColors.white,
        primary: AppColors.primary,
      ),
    );
  }
}
