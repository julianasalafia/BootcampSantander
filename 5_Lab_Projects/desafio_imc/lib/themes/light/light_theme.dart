import 'package:desafio_imc/shared/app_colors.dart';
import 'package:flutter/material.dart';

import 'light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.rosaDuo,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.branco,
        fontSize: 16,
      ),
      iconTheme: IconThemeData(color: AppColors.branco),
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: LightColors.vinho),
      bodyMedium: TextStyle(color: LightColors.vinho),
    ),
    scaffoldBackgroundColor: AppColors.rosa,
  );
}
