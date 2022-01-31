import 'package:flutter/material.dart';

final ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.white,
    primaryVariant: AppColors.secondary,
    secondary: AppColors.secondary[100]!,
    secondaryVariant: AppColors.secondary[400]!,
    surface: AppColors.white,
    background: AppColors.white,
    error: AppColors.redError,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.white,
    onBackground: AppColors.black,
    onError: AppColors.white,
    brightness: Brightness.light);

class AppColors {
  static const MaterialColor secondary = MaterialColor(0xFF3588fd, {
    50: Color(0xff8FD974),
    100: Color(0xff7AC968),
    200: Color(0xff5BB462),
    300: Color(0xff4CA456),
    400: Color(0xff48a7ff),
    500: Color(0xff3297ff),
    600: Color(0xff3588fd),
    700: Color(0xff3575e9),
    800: Color(0xff394141),
  });

  // Additional
  static const Color redError = Color(0xFFFE5C36);
  static const Color orange = Color(0xFFFFB449);
  static const Color blue = Color(0xFF54AFBC);
  static const Color tundora = Color(0xFF434343);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}
