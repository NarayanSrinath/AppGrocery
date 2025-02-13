import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/core/utils/AppColors.dart';


class AppFonts {
  // Text Styles
  static TextStyle heading = GoogleFonts.lato(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle subHeading = GoogleFonts.lato(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );

  static TextStyle body = GoogleFonts.lato(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static TextStyle bold = GoogleFonts.lato(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle italic = GoogleFonts.lato(
    fontSize: 16.0,
    fontStyle: FontStyle.italic,
    color: AppColors.black,
  );

  static TextStyle caption = GoogleFonts.lato(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.7),
  );

  static TextStyle button = GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  // TextTheme for Global Use in ThemeData
  static TextTheme textTheme = TextTheme(
    displayLarge: heading,
    titleLarge: subHeading,
    bodyLarge: body,
    bodyMedium: caption,
    labelLarge: button,
  );
}
