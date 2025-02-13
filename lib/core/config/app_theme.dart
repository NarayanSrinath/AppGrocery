import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

import 'package:groceryapp/core/utils/AppColors.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: AppFonts.textTheme, // ✅ Using textTheme from AppFonts
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    buttonTheme:const  ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
