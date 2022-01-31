import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:gangapp_flutter/ui/theme/text_theme.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    scaffoldBackgroundColor: Colors.white,
    errorColor: AppColors.redError,
    colorScheme: lightColorScheme,
    primarySwatch: AppColors.secondary,
    backgroundColor: AppColors.white,
    inputDecorationTheme: inputTheme);

const InputDecorationTheme inputTheme =
    InputDecorationTheme(border: OutlineInputBorder());
