import 'package:flutter/material.dart';
import 'package:cursor_demo/uikit/app_colors.dart';
import 'package:cursor_demo/uikit/app_text_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      error: AppColors.errorLight,
      onError: AppColors.onErrorLight,
      background: AppColors.backgroundLight,
      onBackground: AppColors.onBackgroundLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.onBackgroundLight),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.onBackgroundLight),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
      background: AppColors.backgroundDark,
      onBackground: AppColors.onBackgroundDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.onBackgroundDark),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.onBackgroundDark),
    ),
  );
}
