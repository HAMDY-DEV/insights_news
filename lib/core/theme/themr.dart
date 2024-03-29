import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insights_news/core/utils/colors.dart';

class AppThemes {
  static ThemeData AppLightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: AppColoes.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColoes.white,
      foregroundColor: AppColoes.primary,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColoes.white,
    ),
    timePickerTheme: TimePickerThemeData(backgroundColor: AppColoes.white),
    colorScheme: ColorScheme.fromSeed(
        primary: AppColoes.primary,
        background: AppColoes.white,
        //text
        onSurface: AppColoes.black,
        seedColor: AppColoes.primary),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColoes.primary,
      prefixIconColor: AppColoes.primary,
      hintStyle: TextStyle(color: AppColoes.grey),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.primary)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.primary)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.red)),
    ),
  );

  static ThemeData AppDarkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: AppColoes.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColoes.darkBackground,
      foregroundColor: AppColoes.primary,
    ),
    datePickerTheme:
        DatePickerThemeData(backgroundColor: AppColoes.darkBackground),
    timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColoes.darkBackground,
        dialBackgroundColor: AppColoes.darkBackground),
    colorScheme: ColorScheme.fromSeed(
        primary: AppColoes.primary,       
        background: AppColoes.darkBackground,
        //text
        onSurface: AppColoes.white,
        seedColor: AppColoes.primary),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColoes.primary,
      prefixIconColor: AppColoes.primary,
      hintStyle: TextStyle(color: AppColoes.grey),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.primary)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.primary)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColoes.red)),
    ),
  );
}
