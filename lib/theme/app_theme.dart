import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryLight,
    cardColor: AppColors.cardLight,
    dividerColor: AppColors.dividerLight,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryLight, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondaryLight, fontSize: 14),
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      error: AppColors.dangerLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,
    cardColor: AppColors.cardDark,
    dividerColor: AppColors.dividerDark,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondaryDark, fontSize: 14),
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      error: AppColors.dangerDark,
    ),
  );
}
