import 'package:evently_app/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {

  static ThemeData lightMode = ThemeData(
    // textTheme: TextTheme(),
      scaffoldBackgroundColor: ColorPalette.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorPalette.white,

      )
  );

}